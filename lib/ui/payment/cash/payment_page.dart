import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:memorylif/application/app_view_model.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/application/main_config/routes/route_path.dart';
import 'package:memorylif/common/logger/log.dart';
import 'package:memorylif/constant/constants.dart';
import 'package:memorylif/data/models/user_model.dart';
import 'package:memorylif/ui/base/base_widget.dart';
import 'package:memorylif/ui/widgets/base_scaffold.dart';
import 'package:memorylif/ui/widgets/flutter_toast.dart';
import 'package:memorylif/ui/widgets/section_vertical_widget.dart';
import 'package:provider/provider.dart';

import '../../../constant/style.dart';
import '../../widgets/big_btn.dart';
import '../../widgets/section_horizontal_widget.dart';
import '../../widgets/section_text_field_with_decor.dart';
import '../components/expiry_date_formatter.dart';


class PaymentPage extends BaseStateFullWidget {
  final PaymentMethodModel paymentMethod;
  PaymentPage({Key? key, required this.paymentMethod}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  paymentType(String assets, {EdgeInsets? padding}) {
    return Expanded(
      child: Container(
          height: 45,
          margin: const EdgeInsets.only(right: 4),
          padding: padding,
          decoration:
              Style.sectionBoxDecoration(color: Colors.white, radius: 7),
          child: Image.asset(assets)),
    );
  }

  Widget getCardTypeFrmNumber(String input) {
    if (input.startsWith(RegExp(
        r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
      return Image.asset(
        "assets/images/master.png",
        height: widget.dimens.k50,
      );
    } else if (input.startsWith(RegExp(r'[4]'))) {
      return Image.asset(
        "assets/images/visa.png",
        height: widget.dimens.k50,
      );
    } else if (input.startsWith(RegExp(r'((376212))'))) {
      return Image.asset(
        "assets/images/american.png",
        height: widget.dimens.k50,
      );
    }
    return Container();
  }

  TextEditingController cardController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final AppViewModel appViewModel = context.watch<AppViewModel>();
    return BaseScaffoldWithBaseContainer(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 60,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Payment',
          style: context.textTheme.headlineSmall?.copyWith(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w600,
            color: Style.whiteColor,
          ),
        ),
        leading: IconButton(
            onPressed: () => widget.navigator.pop(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Style.backgroundColor,
            )),
        // bottom: PreferredSize(
        //     preferredSize: const Size.fromHeight(0),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: [
        //         paymentType("assets/images/visa.png"),
        //         paymentType("assets/images/master.png"),
        //         paymentType("assets/images/american.png"),
        //         // paymentType("assets/images/discover.png", padding: const EdgeInsets.symmetric(horizontal: 6)),
        //       ],
        //     ).addPadding(EdgeInsets.symmetric(horizontal: widget.dimens.k20, vertical: 20))),
      ),
      resizeToAvoidBottomInset: true,
      scroll: true,
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.dimens.k30.verticalBoxPadding(),
            SectionVerticalWidget(
                crossAxisAlignment: CrossAxisAlignment.start,
                firstWidget: Text(
                  'payment amount',
                  style: context.textTheme.titleSmall!.copyWith(
                      color: Style.primaryColor, fontFamily: "Raleway"),
                ),
                secondWidget: Text(
                  "\$ ${widget.paymentMethod.amount}",
                  style: context.textTheme.headlineMedium!.copyWith(
                      color: Style.primaryColor, fontWeight: FontWeight.bold),
                )),
            widget.dimens.k16.verticalBoxPadding(),
            SectionTextFieldDecor(
              hintText: 'Name on card',
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              controller: nameController,
              validator: (input) {
                return (input!.isEmpty) ? 'Required Field' : null;
              },
            ),
            SectionHorizontalWidget(
                firstWidget: Expanded(
                  child: SectionTextFieldDecor(
                    hintText: "42xx xxxx xxxx xxxx",
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    onChanged: (c) {
                      setState(() {});
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(16),
                    ],
                    controller: cardController,
                    validator: (input) {
                      return (input!.isEmpty) ? 'Required Field' : null;
                    },
                  ),
                ),
                secondWidget: getCardTypeFrmNumber(cardController.text.trim())),
            SectionHorizontalWidget(
                firstWidget: Expanded(
                  child: SectionTextFieldDecor(
                    controller: expiryDateController,
                    hintText: "Expiry date",
                    keyboardType: TextInputType.number,
                    validateMode: AutovalidateMode.onUserInteraction,
                    textInputAction: TextInputAction.next,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(5),
                      ExpiryDateFormatter()
                    ],
                    validator: (input) {
                      if (input!.isEmpty) {
                        return null;
                      }
                      if (input.length == 5) {
                        final expiry = input.split("/");

                        final month = int.parse(expiry[0]);
                        if (month.toString().length != 2 || month > 12) {
                          return "Invalid Date";
                        }
                        final year = int.parse("20${expiry[1]}");

                        final currentDate =
                            DateTime(DateTime.now().year, DateTime.now().month);
                        DateTime selectedDate = DateTime(year, month);
                        if (selectedDate.isAfter(currentDate)) {
                          return null;
                        }
                        return "Invalid Date";
                      }
                      return "Invalid Date";
                    },
                  ),
                ),
                secondWidget: Expanded(
                  child: SectionTextFieldDecor(
                    hintText: "CVC code",
                    controller: cvvController,
                    inputFormatters: [LengthLimitingTextInputFormatter(4)],
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    validator: (input) {
                      return (input!.isEmpty) ? 'Required Field' : null;
                    },
                  ),
                )),
            // PaymentConsentFooter(saveLaterUseOnChange: (c){},signConsentOnChange: (c){},),
            widget.dimens.k16.verticalBoxPadding(),
            isLoading ? const Center(
              child: CircularProgressIndicator(
                color: Style.primaryColor,
              ),
            ) : BigBtn(
              onTap: widget.paymentMethod.isSignUp ? () async {
                setState(() {
                  isLoading = true;
                });
                int month, year;
                month = expiryDateController.text.split('/').first.toInt();
                year = expiryDateController.text.split('/').last.toInt();
                final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
                CollectionReference users = FirebaseFirestore.instance.collection('users');
                if(googleUser != null){
                  final user = await users.doc(googleUser.email).get();
                  if(user.exists){
                    widget.iPrefHelper.setAppStatusPremium(true);
                    d(widget.iPrefHelper.getAppPremiumStatus().toString());
                    d('user.data() ${user.data().toString()}');
                    UserModel userData = UserModel.fromJson(user.data() as Map<String, dynamic>);
                    // UserModel userData =
                    // UserModel(name: googleUser.displayName, email: googleUser.email, );
                    widget.iPrefHelper.saveUser(userData);
                    d(widget.iPrefHelper.retrieveUser().toString());
                    SectionToast.show('Account with ${googleUser.email } already exists');
                    widget.navigator.pushReplacementNamed(RoutePath.dashboardScreen);
                    await GoogleSignIn().disconnect();
                  }else{
                    final status = await appViewModel.paymentApi(
                      cardNumber: cardController.text.toInt(),
                      expMonth: month,
                      expYear: year,
                      cvc: cvvController.text.toInt(),
                      amount: widget.paymentMethod.amount,
                    );

                    d('status::: $status');
                    if(status == 'succeeded'){
                      widget.iPrefHelper.setAppStatusPremium(true);
                      d(widget.iPrefHelper.getAppPremiumStatus().toString());
                      UserModel userData =
                      UserModel(name: googleUser.displayName, email: googleUser.email, isPremiumUser: true, hasOrderedBook: false);
                      await writeUserDataOnFirebase(
                          email: googleUser.email, name: googleUser.displayName ?? '');
                      widget.iPrefHelper.saveUser(userData);
                      d(widget.iPrefHelper.retrieveUser().toString());
                      widget.navigator.pushReplacementNamed(RoutePath.dashboardScreen);
                      await GoogleSignIn().disconnect();
                    }else{
                      SectionToast.show('Payment could not proceed');
                    }
                  }
                }else{
                  SectionToast.show('Something went wrong');
                }
                setState(() {
                  isLoading = false;
                });
              } : ()async{
                setState(() {
                  isLoading = true;
                });
                if(widget.iPrefHelper.retrieveUser()['isPremiumUser'] == true){
                  int month, year;
                  month = expiryDateController.text.split('/').first.toInt();
                  year = expiryDateController.text.split('/').last.toInt();
                  final status = await appViewModel.paymentApi(
                    cardNumber: cardController.text.toInt(),
                    expMonth: month,
                    expYear: year,
                    cvc: cvvController.text.toInt(),
                    amount: widget.paymentMethod.amount,
                  );
                  if(status == 'succeeded'){
                    UserModel? user = appViewModel.userData;
                    user!.hasOrderedBook = true;
                    widget.iPrefHelper.saveUser(user);
                    appViewModel.saveUserModel(newUserData: user);
                    FirebaseFirestore.instance.collection('users').doc(widget.iPrefHelper.retrieveUser()['email']).update(
                        user.toJson()
                    );
                    widget.navigator.pushNamedAndRemoveUntil(RoutePath.dashboardScreen);
                  }
                }else{
                  SectionToast.show('You are not a premium user');
                }
                setState(() {
                  isLoading = false;
                });
              },
              showGradient: false,
              color: Style.primaryColor,
              child: Text(
                'Pay now',
                style: context.textTheme.titleMedium?.copyWith(
                    fontFamily: 'Raleway',
                    color: Style.backgroundColor,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            widget.dimens.k16.verticalBoxPadding(),
          ],
        ),
      ),
    );
  }

  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      widget.iPrefHelper.setAppStatusPremium(true);
      UserModel userData =
          UserModel(name: googleUser.displayName, email: googleUser.email);
      await writeUserDataOnFirebase(
          email: googleUser.email, name: googleUser.displayName ?? '');
      widget.iPrefHelper.saveUser(userData);
      d(widget.iPrefHelper.retrieveUser().toString());
      widget.navigator.pushReplacementNamed(RoutePath.dashboardScreen);
      await GoogleSignIn().disconnect();
    } else {
      SectionToast.show('Something went wrong');
    }
  }

  writeUserDataOnFirebase({required String email, required String name}) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users
        .doc(email)
        .set({'email': email, 'name': name, 'isPremiumUser': true, 'hasOrderedBook': false});
  }
}


class PaymentMethodModel{
  final double amount;
  final bool isSignUp;

  PaymentMethodModel({required this.amount, required this.isSignUp});
}