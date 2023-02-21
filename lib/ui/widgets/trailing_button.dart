
import 'package:flutter/material.dart';

import '../../constant/style.dart';
import '../base/base_widget.dart';

class TrailingButton extends BaseStateLessWidget {
   TrailingButton({
    Key? key,
   required  this.child,
    this.callBack
  }) : super(key: key);
  final Widget child ;
  final VoidCallback? callBack ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: dimens.k8),
      child: IconButton(
          onPressed: callBack,
          icon: Container(

              constraints: BoxConstraints(maxHeight: dimens.k30, maxWidth: dimens.k30),
              decoration: Style.sectionBoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(dimens.k10)),
              padding: EdgeInsets.all(dimens.k8),
              child: child),
    ));
  }
}
