
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/ui/base/base_widget.dart';
import 'package:memorylif/ui/widgets/big_btn.dart';


class SuccessDialogView extends BaseStateFullWidget {
  final ValueChanged<bool> onConfirm;
  final String title ;
 final  Widget? subtitleWidget;
  final String? subtitle ;
  SuccessDialogView({Key? key, required this.onConfirm,required this.title, this.subtitle,this.subtitleWidget }) : super(key: key);

  @override
  State<SuccessDialogView> createState() => _DialogViewState();
}

class _DialogViewState<T> extends State<SuccessDialogView> {
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
                      padding: const EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 30),
                      decoration: Style.sectionBoxDecoration(color: Colors.white, radius: 30),
                      child: Column(
                        children: [
                          // SvgAssets.doneGradient,
                          const SizedBox(height: 30),
                          Text(
                            widget.title,
                            style: context.textTheme.headline6
                                ?.copyWith(fontFamily: 'Raleway', color: Style.backgroundColor, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 18),
                          widget.subtitleWidget ?? Text(
                            widget.subtitle!,
                            style: context.textTheme.headline5?.copyWith(
                                fontSize: 18,
                                fontFamily: 'Raleway', color: Style.primaryColor, fontWeight: FontWeight.w600),
                          ),    const SizedBox(height: 30),
                          BigBtn(
                            onTap: () {
                              widget.onConfirm(true);
                              widget.navigator.pop();
                            },
                            showGradient: true,
                            child: Text(
                              'low',
                              style: context.textTheme.subtitle1?.copyWith(
                                  fontFamily: 'Raleway', color: Style.primaryColor, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )
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
