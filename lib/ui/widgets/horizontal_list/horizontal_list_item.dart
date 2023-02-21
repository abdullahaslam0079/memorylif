import 'package:flutter/material.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/constant/constants.dart';
import 'package:memorylif/ui/base/base_widget.dart';
import 'package:memorylif/ui/widgets/section_vertical_widget.dart';


import '../../../../constant/style.dart';

class HorizontalListItem extends BaseStateLessWidget {
  HorizontalListItem({
    Key? key,
    required this.index
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: dimens.k8),
      width: context.getWidth(0.8),
      height: dimens.k250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: context.getWidth(),
              decoration: Style.sectionBoxDecoration(color: Colors.transparent, radius: dimens.k15),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(dimens.k15),
                        child: Image.asset(
                          'assets/maintain_fit.png',
                          height: dimens.k200,
                          fit: BoxFit.cover,
                        ),
                      )),

                  SizedBox.square(
                      dimension: dimens.k30,
                      child: Image.asset(
                        'assets/play_btn_green.png',
                        fit: BoxFit.cover,
                      )),
                ],
              ),
            ),
          ),
          dimens.k8.verticalBoxPadding(),
          SectionVerticalWidget(
              firstWidget: Text("Video Title",
                  style: context.textTheme.subtitle1?.copyWith(
                      color: Style.primaryColor, fontWeight: FontWeight.w600, fontFamily: "Raleway")),
              gap: dimens.k4,
              secondWidget: Text("In publishing and graphic design, Lorem ipsum is a placeholder text commonly",
                  style: context.textTheme.caption?.copyWith(color: Style.accentColor, fontFamily: "Raleway")))
        ],
      ),
    );
  }
}