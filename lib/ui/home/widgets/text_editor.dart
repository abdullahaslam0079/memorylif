import 'package:cloud_firestore/cloud_firestore.dart';
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
  CollectionReference users = FirebaseFirestore.instance.collection('content');
  var val = '';

  getSetFirebaseContent({required String todayContent}) async {
    await users.doc(widget.iPrefHelper.retrieveUser()['email']).collection(getMonthName(DateTime.now().month)).doc(DateTime.now().format(Constants.apiDateFormat))
        .set({'content': todayContent});
    final content = await users
        .doc(widget.iPrefHelper.retrieveUser()['email'])
        .collection(getMonthName(DateTime.now().month))
        .doc(DateTime.now().format(Constants.apiDateFormat))
        .get();
    d('FireBase Content ::: $content');
    d('FireBase content.data() ::: ${content.data()}');
    d('FireBase content.metadata ::: ${content.metadata}');
    d('FireBase content.reference ::: ${content.reference}');
    d('FireBase content.get(content) ::: ${content.get('content')}');
  }

  checkIfTodayContentExist() {
    final bookViewModel = context.read<BookViewModel>();
    if (bookViewModel.todayContent != null) {
      d('TODAY ALREADY CONTENT ::: ${bookViewModel.todayContent}');
      _keyEditor.currentState?.text = bookViewModel.todayContent!;
      d('After...... ${_keyEditor.currentState?.text}');
    }
  }

  @override
  void initState() {
    super.initState();
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
              returnContent: (value) {})
          .addPadding(EdgeInsets.only(
              left: widget.dimens.k15,
              right: widget.dimens.k15,
              top: widget.dimens.k15,
              bottom: widget.dimens.k30)),
      floatingActionButton: GestureDetector(
        onTap: () async {
          final content = await _keyEditor.currentState?.getText();
          d(content.toString());
          bookViewModel.putContentInBook(
              date: DateTime.now().format(Constants.apiDateFormat),
              textContent: content!);
          bookViewModel.updateTodayContent(content: content);
          if (content.isNotEmpty) {
            d('getAppPremiumStatus() ${widget.iPrefHelper.getAppPremiumStatus()}');
            if (widget.iPrefHelper.getAppPremiumStatus() == true) {
              await getSetFirebaseContent(todayContent: content);
            }
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
