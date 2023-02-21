
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/ui/base/base_widget.dart';
import 'package:memorylif/ui/widgets/big_btn.dart';
import 'package:memorylif/ui/widgets/section_horizontal_widget.dart';
import 'package:memorylif/ui/widgets/section_vertical_widget.dart';

class GreatJobDialogView extends BaseStateFullWidget {
  final ValueChanged<bool> onConfirm;
  final String title ;
  final String subtitle ;
  GreatJobDialogView({Key? key, required this.onConfirm,required this.title,required this.subtitle}) : super(key: key);

  @override
  State<GreatJobDialogView> createState() => _DialogViewState();
}

class _DialogViewState<T> extends State<GreatJobDialogView> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.dimens.k30),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Material(
                  borderRadius: BorderRadius.circular(30),
                  elevation: 4.0,
                  child: Stack(alignment: AlignmentDirectional.topEnd, children: [
                    Container(
                      padding: const EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
                      decoration: Style.sectionBoxDecoration(color: Style.backgroundColor, radius: 30),
                      child: SectionVerticalWidget(
                        firstWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                           widget.title,
                              style: context.textTheme.headline6
                                  ?.copyWith(fontFamily: 'Raleway', color: Style.primaryColor, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        gap: 30,
                        secondWidget: SectionVerticalWidget(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          firstWidget: SectionVerticalWidget(
                            firstWidget: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  "assets/great_job.png",
                                  height: 120,
                                  width: 120,
                                ),
                                Lottie.asset('assets/animation/confetti.json', animate: true, height: 120, width: 120),
                              ],
                            ),
                            crossAxisAlignment: CrossAxisAlignment.center,
                            secondWidget: SectionHorizontalWidget(
                                firstWidget: Text(
                                widget.subtitle,
                                  style: context.textTheme.headline5?.copyWith(
                                    fontSize: 18,
                                      fontFamily: 'Raleway', color: Style.primaryColor, fontWeight: FontWeight.w600),
                                ),
                                secondWidget:
                                    Lottie.asset('assets/animation/celebrating_emoji.json', animate: true, height: 30)),
                          ),
                          secondWidget: BigBtn(
                            onTap: () {
                              widget.onConfirm(true);
                              widget.navigator.pop();
                            },
                            showGradient: true,
                            child: Text(
                              'Share',
                              style: context.textTheme.subtitle1?.copyWith(
                                  fontFamily: 'Raleway', color: Style.primaryColor, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          gap: 30,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          widget.navigator.pop();
                          // widget.onConfirm(true);
                        },
                        icon: const Icon(
                          FontAwesomeIcons.circleXmark,
                          size: 20,
                          color: Style.primaryColor,
                        ))
                  ]))
            ])));
  }
}
