import 'package:flutter/material.dart';
import 'package:flutter_summernote/flutter_summernote.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/ui/base/base_widget.dart';
import 'package:memorylif/ui/widgets/app_bar.dart';
import 'package:memorylif/ui/widgets/back_button.dart';
import 'package:memorylif/ui/widgets/base_scaffold.dart';

class TextEditorScreen extends BaseStateFullWidget {
  TextEditorScreen({Key? key}) : super(key: key);

  @override
  State<TextEditorScreen> createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditorScreen> {

  GlobalKey<FlutterSummernoteState> _keyEditor = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarLogoWidget(
        leading: CustomBackButton(),
      ),
      body: FlutterSummernote(
          hint: "Your text here...",
          key: _keyEditor,
          showBottomToolbar: true,
          hasAttachment: true,
          decoration: BoxDecoration(
            color: Style.cardColor,
            borderRadius: BorderRadius.circular(widget.dimens.k10),
          ),
          customToolbar: """
            [
                ['style', ['bold', 'italic', 'underline', 'clear']],
                ['font', ['strikethrough', 'superscript', 'subscript']]
            ]""",
          returnContent: (value){

          }
      ).addPadding(EdgeInsets.only(left: widget.dimens.k15, right: widget.dimens.k15, top: widget.dimens.k15, bottom: widget.dimens.k30)),
    );
  }
}
