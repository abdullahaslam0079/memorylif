
import 'package:flutter/material.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/ui/base/base_widget.dart';


import '../../constant/style.dart';
import 'big_btn.dart';
class AnimatedBottomButton extends BaseStateLessWidget {
   AnimatedBottomButton({
    Key? key,
    required bool showFab,
  }) : _showFab = showFab, super(key: key);

  final bool _showFab;


  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _showFab ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 350),
      child: BigBtn(
        onTap: () {},
        showGradient: true,
        padding: EdgeInsets.symmetric(horizontal: dimens.k20),
        child: Text(
          'Share',
          style: context.textTheme.subtitle1?.copyWith(
              fontFamily: 'Raleway',
              color: Style.backgroundColor,
              fontWeight: FontWeight.w600,
              fontSize: dimens.k16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
