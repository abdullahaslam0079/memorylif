
import 'package:flutter/material.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/ui/base/base_widget.dart';


class AppBarLogoWidget extends BaseStateLessWidget implements PreferredSizeWidget {
  final bool? automaticallyImplyLeading;
  final double appBarHeight;
  final Widget? leading;
  final bool sameHeight;
  final List<Widget>? actions;
  AppBarLogoWidget(
      {Key? key,
      this.sameHeight = true,
      this.appBarHeight = kToolbarHeight,
      this.automaticallyImplyLeading,
      this.leading,
      this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Style.backgroundColor,
      elevation: 1,
      centerTitle: true,
      toolbarHeight: sameHeight ? appBarHeight : null,
      automaticallyImplyLeading: automaticallyImplyLeading ?? false,
      leading: leading,
      actions: actions,
      title: Container(
        height: dimens.k40,
        width: dimens.k150,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/logofull.jpeg'),
            fit: BoxFit.cover,
          )
        ),
      ),
      titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(color: Style.backgroundColor, fontFamily: 'Raleway'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}

class AppBarWidget extends BaseStateLessWidget implements PreferredSizeWidget {
  final bool? automaticallyImplyLeading;
  final double appBarHeight;
  final double? leadingWidth;
  final String title;
  final Widget? leading;
  final Widget? titleWidget;
  final bool sameHeight;
  final Color? itemColor;
  final List<Widget>? actions;
  AppBarWidget(
      {Key? key,
      this.appBarHeight = kToolbarHeight,
      this.automaticallyImplyLeading,
      required this.title,
        this.leadingWidth,
        this.titleWidget,
      this.leading,
      this.itemColor,
      this.actions,
      this.sameHeight = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      toolbarHeight: sameHeight ? appBarHeight : null,
      automaticallyImplyLeading: automaticallyImplyLeading ?? false,
      leading: leading,
      leadingWidth: leadingWidth,
      actions: actions,
      title: titleWidget ?? Text(title, style: TextStyle(color:  itemColor ?? Style.backgroundColor, fontFamily: 'Raleway'),),
      titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
