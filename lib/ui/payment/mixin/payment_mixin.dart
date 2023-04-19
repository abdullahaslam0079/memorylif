import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/ui/base/base_widget.dart';
import 'package:memorylif/ui/widgets/app_bar.dart';

mixin PaymentMixin<T extends BaseStateFullWidget> on State<T> {
  TextStyle? textStyle() => context.textTheme.titleSmall
      ?.copyWith(fontFamily: 'Raleway', color: Style.backgroundColor, fontWeight: FontWeight.w600);
  PreferredSizeWidget mainAppBar(String title) => AppBarWidget(
        appBarHeight: context.getWidth(0.38),
        sameHeight: false,
        title: title,
        leading: IconButton(
            onPressed: () => widget.navigator.pop(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Style.backgroundColor,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Style.backgroundColor,
              )),
        ],
      );

  PreferredSizeWidget appBar(String title) => AppBarWidget(
        appBarHeight: kToolbarHeight,
        title: title,
        leading: IconButton(
            onPressed: () => widget.navigator.pop(),
            icon: const Icon(
              FontAwesomeIcons.xmark,
              color: Style.backgroundColor,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.circleInfo,
                color: Style.backgroundColor,
              )),
        ],
      );

  PreferredSizeWidget appBar2(String title,
          {Color? itemColor, List<Widget>? actions, double? appBarHeight, Widget? titleWidget}) =>
      AppBarWidget(
          appBarHeight: appBarHeight ?? widget.dimens.toolBarHeight,
          title: title,
          titleWidget: titleWidget,
          itemColor: itemColor ?? Style.backgroundColor,
          leading: IconButton(
              onPressed: () => widget.navigator.pop(),
              icon: Icon(
                FontAwesomeIcons.chevronLeft,
                color: itemColor ?? Style.backgroundColor,
              )),
          actions: actions);

  PreferredSizeWidget tabBarAppBar(
          {Color? itemColor, List<Widget>? actions, double? appBarHeight, Widget? titleWidget}) =>
      AppBarWidget(
          appBarHeight: appBarHeight ?? widget.dimens.toolBarHeight,
          title: '',
          titleWidget: titleWidget,
          itemColor: itemColor ?? Style.backgroundColor,
          actions: actions);

}
