import 'package:flutter/material.dart';
import 'package:flutter_summernote/flutter_summernote.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:memorylif/application/book_view_model.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/application/main_config/routes/route_path.dart';
import 'package:memorylif/constant/constants.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/data/hive/book_content_model.dart';
import 'package:memorylif/ui/base/base_widget.dart';
import 'package:memorylif/ui/widgets/app_bar.dart';
import 'package:memorylif/ui/widgets/back_button.dart';
import 'package:memorylif/ui/widgets/base_scaffold.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../../../common/logger/log.dart';

class TextEditorScreen extends BaseStateFullWidget {
  TextEditorScreen({Key? key}) : super(key: key);

  @override
  State<TextEditorScreen> createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditorScreen> {
  final GlobalKey<FlutterSummernoteState> _keyEditor = GlobalKey();
  Box? _dailyContent;
  BookContentModel? bookContentModel;


  var val = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Hive.registerAdapter(BookContentModelAdapter());
  }

  Future _openBox() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    _dailyContent = await Hive.openBox('dailyContent');
    bookContentModel = BookContentModel(
      '30-12-2022',
      'This is flutter This is flutter This is flutter This is flutter',
    );
    _dailyContent!.add(bookContentModel);
    d(_dailyContent!.get('dailyContent'));
    return;
  }

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
              height: widget.dimens.k650,
              showBottomToolbar: false,
              hasAttachment: false,
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

      floatingActionButton: GestureDetector(
        onTap: ()async{
          // d('${_keyEditor.currentState?.text}');
          final content = await _keyEditor.currentState?.getText();
          d(content.toString());
          bookViewModel.putContentInBook(date: DateTime.now().format(Constants.apiDateFormat), textContent: content!);
          bookViewModel.updateTodayContent(content: content);
          if(content.isNotEmpty){
            widget.navigator.pushNamedAndRemoveUntil(RoutePath.dashboardScreen);
          }
        },
        child: Container(
          height: widget.dimens.k50,
          width: context.width,
          decoration: BoxDecoration(
            color: Style.primaryColor,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Style.cardColor),
          ),
          child: Center(
            child: Text(
              'That\'s It',
              style: context.textTheme.bodyText1?.copyWith(
                color: Colors.white,
              ),
            ).addPadding(EdgeInsets.symmetric(horizontal: widget.dimens.k15)),
          ),
        ),
      ).addPadding(EdgeInsets.symmetric(horizontal: widget.dimens.k15)),
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
