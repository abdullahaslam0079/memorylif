import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/application/main_config/routes/route_path.dart';
import 'package:memorylif/common/logger/log.dart';
import 'package:memorylif/constant/Images/svgs.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/data/models/user_model.dart';
import 'package:memorylif/ui/base/base_widget.dart';
import 'package:memorylif/ui/widgets/app_bar.dart';
import 'package:memorylif/ui/widgets/back_button.dart';
import 'package:memorylif/ui/widgets/base_scaffold.dart';
import 'package:memorylif/ui/widgets/flutter_toast.dart';

class AlreadyHaveAccount extends BaseStateFullWidget {
  AlreadyHaveAccount({Key? key}) : super(key: key);

  @override
  State<AlreadyHaveAccount> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<AlreadyHaveAccount> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarLogoWidget(
        leading: CustomBackButton(),
      ),
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: widget.dimens.k20,
              ),
              Text(
                'You had already an \naccount?',
                style: context.textTheme.headline5?.copyWith(
                  color: Style.textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: widget.dimens.k50,
              ),
              Text(
                'If you paid the premium version and uninstall the application ot lost your phone then no problem, just connect with Google and all your data will be recovered.\n\nIf you didn\'t have premium version then sorry, we cannot recover your data.',
                style: context.textTheme.bodyText2?.copyWith(
                  color: Style.textColor,
                ),
              ),

              SizedBox(
                height: widget.dimens.k20,
              ),

              Row(
                children: <Widget>[
                  Icon(
                    Icons.check_box_outlined,
                    color: Style.primaryColor,
                    size: widget.dimens.k20,
                  ).addPadding(EdgeInsets.only(right: widget.dimens.k10)),
                  Text(
                    'I accept Terms and Conditions',
                    style: context.textTheme.bodyText2?.copyWith(
                      color: Style.textColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: widget.dimens.k60,
              ),
              Container(
                      height: widget.dimens.k50,
                      width: context.width,
                      decoration: BoxDecoration(
                        color: Style.primaryColor,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Style.primaryColor),
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            decoration: const BoxDecoration(
                              color: Style.whiteColor,
                              shape: BoxShape.circle,
                            ),
                            child: SvgAssets.googleIcon
                                .addPadding(EdgeInsets.all(widget.dimens.k5)),
                          ).addPadding(const EdgeInsets.only(
                            right: 10,
                            top: 10,
                            bottom: 10,
                          )),
                          Text(
                            'Continue with Google',
                            style: context.textTheme.bodyText1?.copyWith(
                              color: Style.whiteColor,
                            ),
                          ),
                        ],
                      ).addPadding(const EdgeInsets.symmetric(horizontal: 5)))
                  .onTap(() {
                signInWithGoogle();
              }),
              SizedBox(
                height: widget.dimens.k10,
              ),
            ]).addPadding(EdgeInsets.symmetric(
            horizontal: widget.dimens.k15, vertical: widget.dimens.k30)),
      ),
    );
  }

  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if(googleUser != null){
      CollectionReference users = FirebaseFirestore.instance.collection('users');
      final doc = await users.doc(googleUser.email).get();
      if(doc.exists){
        widget.iPrefHelper.setAppStatusPremium(true);
        d(widget.iPrefHelper.getAppPremiumStatus().toString());
        UserModel userData = UserModel(name: googleUser.displayName, email: googleUser.email);
        await writeUserDataOnFirebase(email: googleUser.email, name: googleUser.displayName ?? '');
        widget.iPrefHelper.saveUser(userData);
        d(widget.iPrefHelper.retrieveUser().toString());
        widget.navigator.pushReplacementNamed(RoutePath.dashboardScreen);
        await GoogleSignIn().disconnect();
      }else{
        SectionToast.show('User with ${googleUser.email} does\'t exist');
        await GoogleSignIn().disconnect();
      }
    }else{
      SectionToast.show('Something went wrong');
    }
  }

  writeUserDataOnFirebase({required String email, required String name})async{
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users.doc(email).set({
      'email': email,
      'name': name,
      'isPremium': true
    });
  }
}
