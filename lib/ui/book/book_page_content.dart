import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/data/models/content_model.dart';
import 'package:memorylif/ui/base/base_widget.dart';
import 'package:memorylif/ui/widgets/app_bar.dart';
import 'package:memorylif/ui/widgets/back_button.dart';
import 'package:memorylif/ui/widgets/base_scaffold.dart';

class BookPageContent extends BaseStateFullWidget {
  final ContentModel contentModel;
  BookPageContent({Key? key, required this.contentModel}) : super(key: key);

  @override
  State<BookPageContent> createState() => _BookPageContentState();
}

class _BookPageContentState extends State<BookPageContent> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarLogoWidget(
        leading: CustomBackButton(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Year ${widget.contentModel.date}',
            style: context.textTheme.bodyMedium?.copyWith(
              color: Style.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Style.cardColor,
            ),
            child: HtmlWidget(
              widget.contentModel.textContent ?? 'You did not write in this day',
              customStylesBuilder: (element) {
                if (element.classes.contains('foo')) {
                  return {'color': 'red'};
                }
                return null;
              },
              customWidgetBuilder: (element) {},
              onErrorBuilder: (context, element, error) =>
                  Text('$element error: $error'),
              onLoadingBuilder: (context, element, loadingProgress) =>
              const CircularProgressIndicator(),
              renderMode: RenderMode.column,
              textStyle: context.textTheme.bodyMedium?.copyWith(
                color: Style.textColor,
              ),
            ).addPadding(EdgeInsets.all(widget.dimens.k15)),
          ).addPadding(EdgeInsets.symmetric(vertical: widget.dimens.k20)),
        ],
      ).addPadding(EdgeInsets.all(widget.dimens.k20)),

    );
  }
}
