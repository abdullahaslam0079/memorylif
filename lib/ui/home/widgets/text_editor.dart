import 'package:flutter/material.dart';
import 'package:flutter_summernote/flutter_summernote.dart';
import 'package:memorylif/application/book_view_model.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/application/main_config/routes/route_import.dart';
import 'package:memorylif/application/main_config/routes/route_path.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/ui/base/base_widget.dart';
import 'package:memorylif/ui/widgets/app_bar.dart';
import 'package:memorylif/ui/widgets/back_button.dart';
import 'package:memorylif/ui/widgets/base_scaffold.dart';
import 'package:provider/provider.dart';

import '../../../common/logger/log.dart';

class TextEditorScreen extends BaseStateFullWidget {
  TextEditorScreen({Key? key}) : super(key: key);

  @override
  State<TextEditorScreen> createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditorScreen> {
  final GlobalKey<FlutterSummernoteState> _keyEditor = GlobalKey();

  var val = '';

  @override
  void dispose() {
    super.dispose();
    _keyEditor.currentState?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bookViewModel = context.watch<BookViewModel>();
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
              returnContent: (value) {

              })
          .addPadding(EdgeInsets.only(
              left: widget.dimens.k15,
              right: widget.dimens.k15,
              top: widget.dimens.k15,
              bottom: widget.dimens.k30)),

      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          final text = await _keyEditor.currentState?.getText();
          d('text:::: ${text}');
          val = (await _keyEditor.currentState?.getText())!;
          d('val:::: ${val}');
          bookViewModel.updateTodayContent(content: val);
          // widget.navigator.pushNamed(RoutePath.dashboardScreen);
        },
      ),
    );
  }
}

/*HtmlWidget(
            // the first parameter (`html`) is required
            val,

            // all other parameters are optional, a few notable params:

            // specify custom styling for an element
            // see supported inline styling below
            customStylesBuilder: (element) {
              if (element.classes.contains('foo')) {
                return {'color': 'red'};
              }

              return null;
            },

            // render a custom widget
            customWidgetBuilder: (element) {},

            // these callbacks are called when a complicated element is loading
            // or failed to render allowing the app to render progress indicator
            // and fallback widget
            onErrorBuilder: (context, element, error) =>
                Text('$element error: $error'),
            onLoadingBuilder: (context, element, loadingProgress) =>
                CircularProgressIndicator(),

            // this callback will be triggered when user taps a link

            // select the render mode for HTML body
            // by default, a simple `Column` is rendered
            // consider using `ListView` or `SliverList` for better performance
            renderMode: RenderMode.column,

            // set the default styling for text
            textStyle: TextStyle(fontSize: 14),
          ),*/
