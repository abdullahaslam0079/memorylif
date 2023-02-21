import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/ui/base/base_widget.dart';
import 'package:memorylif/ui/widgets/app_bar.dart';
import 'package:memorylif/ui/widgets/base_scaffold.dart';

class TextEditorScreen extends BaseStateFullWidget {
  TextEditorScreen({Key? key}) : super(key: key);

  @override
  State<TextEditorScreen> createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditorScreen> {

  final QuillController _controller = QuillController.basic();


  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarLogoWidget(),
      body: SafeArea(
        child: Column(
          children: [
            QuillToolbar.basic(controller: _controller),
            Expanded(
              child: Container(
                child: QuillEditor.basic(
                  controller: _controller,
                  readOnly: false, // true for view only mode
                ),
              ),
            )
          ],
        ).addPadding(EdgeInsets.all(widget.dimens.k15)),
      ),
    );
  }
}
