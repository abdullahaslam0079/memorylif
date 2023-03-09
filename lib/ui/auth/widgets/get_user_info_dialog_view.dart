import 'package:memorylif/application/app_view_model.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/application/main_config/routes/route_path.dart';
import 'package:memorylif/common/logger/log.dart';
import 'package:memorylif/constant/constants.dart';
import 'package:memorylif/data/local_data_source/preference/i_pref_helper.dart';
import 'package:memorylif/data/local_data_source/preference/pref_helper.dart';
import 'package:memorylif/data/models/user_model.dart';
import 'package:memorylif/ui/base/base_mixin.dart';
import 'package:memorylif/ui/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:memorylif/ui/widgets/big_btn.dart';
import 'package:memorylif/ui/widgets/section_text_field_with_decor.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../constant/style.dart';

class GetUserInfoDialogView extends BaseStateFullWidget{
  GetUserInfoDialogView({Key? key}) : super(key: key);

  @override
  State<GetUserInfoDialogView> createState() => _GetUserInfoDialogViewState();
}

class _GetUserInfoDialogViewState extends State<GetUserInfoDialogView> with BaseMixin{

  final TextEditingController _nameController = TextEditingController();

  late final IPrefHelper iPrefHelper;

  getPrefHelper()async{
    iPrefHelper = PrefHelper(await SharedPreferences.getInstance());
  }

  @override
  void initState() {
    super.initState();
    getPrefHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Material(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            elevation: 4.0,
            child: SizedBox(
              height: dimens.k230,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: Text(
                            'Information',
                            style: context.textTheme.bodyText1?.copyWith(
                              fontFamily: 'Raleway',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Style.textColor,
                            ),
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.cancel_outlined,
                        color: Style.textColor,
                        size: 16,
                      ).onTap(() {
                        Navigator.pop(context);
                      })
                    ],
                  ),
                  dimens.k30.verticalBoxPadding(),
                  SectionTextFieldDecor(
                    hintText: 'Name',
                    controller: _nameController,
                  ),
                  dimens.k15.verticalBoxPadding(),
                  BigBtn(
                    onTap: () {
                      iPrefHelper.setAppStatusPremium(false);
                      d(iPrefHelper.getAppPremiumStatus().toString());
                      UserModel userData = UserModel(name: _nameController.text);
                      iPrefHelper.saveUser(userData);
                      d(iPrefHelper.retrieveUser().toString());
                      widget.navigator.pushReplacementNamed(RoutePath.dashboardScreen);
                      context.read<AppViewModel>().saveUserModel(newUserData: userData);
                      d('UserData::: ${context.read<AppViewModel>().userData}');
                    },
                    showGradient: false,
                    elevation: 0.0,
                    radius: dimens.k25,
                    child: Text(
                      'Continue',
                      style: context.textTheme.subtitle1?.copyWith(
                        fontFamily: 'Raleway',
                        color: Style.cardColor,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ).addPadding(EdgeInsets.all(dimens.k20)),
            ),
          ),
        ),
      ),
    );
  }
}


