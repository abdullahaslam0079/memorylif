import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memorylif/application/app_view_model.dart';
import 'package:memorylif/application/book_view_model.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/data/models/user_model.dart';
import 'package:memorylif/ui/base/base_widget.dart';
import 'package:memorylif/ui/book/my_book_screen.dart';
import 'package:memorylif/ui/home/home_screen.dart';
import 'package:memorylif/ui/profile/my_profile_screen.dart';
import 'package:memorylif/ui/widgets/app_bar.dart';
import 'package:memorylif/ui/widgets/base_scaffold.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class DashboardScreen extends BaseStateFullWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  setLocalDb()async{
    final bookViewModel = context.read<BookViewModel>();
    await bookViewModel.openBook();
    await bookViewModel.FetchDataFromFirebase();
  }

  @override
  void initState() {
    final appViewModel = context.read<AppViewModel>();
    appViewModel.saveUserModel(newUserData: UserModel.fromJson(widget.iPrefHelper.retrieveUser()));
    super.initState();
    setLocalDb();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarLogoWidget(),
      body: _currentIndex == 0
          ? HomeScreen()
          : _currentIndex == 1
              ? MyBookScreen()
              : MyProfileScreen(),
      bottomNavBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: FaIcon(
              FontAwesomeIcons.house,
              size: widget.dimens.k18,
            ),
            title: const Text("Home"),
            selectedColor: Style.primaryColor,
            unselectedColor: Style.cardColor,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: FaIcon(
              FontAwesomeIcons.book,
              size: widget.dimens.k18,
            ),
            title: const Text("book"),
            selectedColor: Style.primaryColor,
            unselectedColor: Style.cardColor,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: FaIcon(
              FontAwesomeIcons.user,
              size: widget.dimens.k18,
            ),
            title: const Text("Profile"),
            selectedColor: Style.primaryColor,
            unselectedColor: Style.cardColor,
          ),
        ],
      ).addPadding(EdgeInsets.symmetric(horizontal: widget.dimens.k15)),
    );
  }
}
