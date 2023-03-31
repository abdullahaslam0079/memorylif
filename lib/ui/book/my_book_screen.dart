import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memorylif/application/book_view_model.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/application/main_config/routes/route_path.dart';
import 'package:memorylif/common/logger/log.dart';
import 'package:memorylif/constant/constants.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/ui/base/base_widget.dart';
import 'package:provider/provider.dart';
import '../../data/models/content_model.dart';

class MyBookScreen extends BaseStateFullWidget {
  MyBookScreen({Key? key}) : super(key: key);

  @override
  State<MyBookScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MyBookScreen> {
  bool isLoading = false;

  // setData()async{
  //   if(widget.iPrefHelper.getAppPremiumStatus() == true){
  //     setState(() {
  //       isLoading = true;
  //     });
  //     BookViewModel bookViewModel = context.read<BookViewModel>();
  //     final users = FirebaseFirestore.instance.collection('content').doc(widget.iPrefHelper.retrieveUser()['email']);
  //     for(int month = 1; month<=DateTime.now().month; month++){
  //       for(int date = 1; date <= DateUtils.getDaysInMonth(DateTime.now().year, month); date++){
  //         d('Date:::: ${date.twoDigits}-${month.twoDigits}-${DateTime.now().year}');
  //         String nDate = '${date.twoDigits}-${month.twoDigits}-${DateTime.now().year}';
  //         final userContent =  await users.collection(getMonthName(month)).doc(nDate).get();
  //         if(userContent.exists){
  //           d(userContent.exists);
  //           bookViewModel.putContentInBook(date: DateTime.now().format(Constants.apiDateFormat), textContent: userContent.get('content'));
  //         }
  //       }
  //     }
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final daysInMonth = DateUtils.getDaysInMonth(DateTime.now().year, 3);
    final bookViewModel = context.watch<BookViewModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: widget.dimens.k10,
        ),
        Text(
          'Hi, ${widget.iPrefHelper.retrieveUser()['name']}',
          style: context.textTheme.headlineSmall?.copyWith(
            color: Style.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: widget.dimens.k10,
        ),
        RichText(
          text: TextSpan(
            text: 'Have a good ',
            style: context.textTheme.bodyMedium?.copyWith(
              color: Style.textColor,
            ),
            children: <TextSpan>[
              TextSpan(
                text: widget.getDayStatus(),
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Style.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: widget.dimens.k30,
        ),
        Text(
          'Year ${DateTime.now().year}',
          style: context.textTheme.bodyMedium?.copyWith(
            color: Style.primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: widget.dimens.k10,
        ),
        Expanded(
          child: bookViewModel.bookContentFetchStatus ==
                  BookContentFetchStatus.loading
              ? Center(
                  child: Text(
                    'Loading data from server...',
                    style: context.textTheme.headlineSmall?.copyWith(
                      color: Style.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      DateTime.now().month,
                      (index) => ExpansionTile(
                        title: Text(
                          getMonthName(index + 1),
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: Style.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        children: List.generate(
                            DateTime.now().month == index + 1
                                ? DateTime.now().day
                                : DateUtils.getDaysInMonth(
                                    DateTime.now().year, index + 1), (i) {
                          int date = i + 1;
                          int month = index + 1;
                          // d('Date:::: ${date.twoDigits}-${month.twoDigits}-${DateTime.now().year}');
                          final content = bookViewModel.getContentFromBook(
                              date:
                                  '${date.twoDigits}-${month.twoDigits}-${DateTime.now().year}');
                          return ListTile(
                            trailing: content == null
                                ? const Icon(Icons.block, color: Style.redColor)
                                : const Icon(Icons.check,
                                    color: Style.primaryColor),
                            shape: BeveledRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(widget.dimens.k8),
                            ),
                            tileColor: content == null
                                ? Colors.white
                                : Style.primaryColor.withOpacity(0.2),
                            title: Text(
                              '${getMonthName(index + 1)} ${i + 1}',
                              style: context.textTheme.subtitle1?.copyWith(
                                color: Style.textColor,
                              ),
                            ),
                            onTap: () {
                              int date = i + 1;
                              int month = index + 1;
                              d('Date:::: ${date.twoDigits}-${month.twoDigits}-${DateTime.now().year}');
                              final content = bookViewModel.getContentFromBook(
                                  date:
                                      '${date.twoDigits}-${month.twoDigits}-${DateTime.now().year}');
                              d('contentcontent..... $content');
                              d('${date.twoDigits}-${month.twoDigits}-${DateTime.now().year}} content --- $content');
                              widget.navigator.pushNamed(
                                RoutePath.bookPageContent,
                                object: ContentModel(
                                  date:
                                      '${date.twoDigits}-${month.twoDigits}-${DateTime.now().year}',
                                  textContent: content,
                                ),
                              );
                            },
                          );
                        }),
                      ),
                    ),
                  ).addPadding(EdgeInsets.only(bottom: widget.dimens.k5)),
                ),
        ),
        Container(
                height: widget.dimens.k50,
                width: context.width,
                decoration: BoxDecoration(
                  color: Style.primaryColor,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Style.primaryColor),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.book,
                      size: widget.dimens.k25,
                      color: Style.cardColor,
                    ).addPadding(EdgeInsets.all(
                      widget.dimens.k10,
                    )),
                    Text(
                      'Pre order your book',
                      style: context.textTheme.bodyText1?.copyWith(
                        color: Style.whiteColor,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '\$ 19.99/year',
                      style: context.textTheme.caption?.copyWith(
                        color: Style.whiteColor,
                      ),
                    ).addPadding(EdgeInsets.only(right: widget.dimens.k10)),
                  ],
                ).addPadding(const EdgeInsets.symmetric(horizontal: 5)))
            .onTap(() {
          showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                // <-- SEE HERE
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25.0),
                ),
              ),
              builder: (context) {
                return bottomSheetWidget();
              });
        }),
      ],
    ).addPadding(EdgeInsets.all(widget.dimens.k15));
  }

  List<String> chapterNames = [
    'The Sad Story',
    'New Journey',
    'A success',
    'Falling Down',
    'Vocations',
    'The Loving Paris',
    'Dedication For Dream'
  ];

  Widget bottomSheetWidget() {
    return SizedBox(
      height: widget.dimens.k350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: widget.dimens.k10,
          ),
          Text(
            'Pre order your book',
            style: context.textTheme.headlineSmall?.copyWith(
              color: Style.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: widget.dimens.k20,
          ),
          Text(
            'If you paid the premium version and uninstall the application ot lost your phone then no problem, just connect with Google and all your data will be recovered.\n\nIf you didn\'t have premium version then sorry, we cannot recover your data.',
            style: context.textTheme.bodyText2?.copyWith(
              color: Style.textColor,
            ),
          ),
          const Spacer(),
          Container(
            height: widget.dimens.k50,
            width: context.width,
            decoration: BoxDecoration(
              color: Style.cardColor,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Style.cardColor),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Order Now',
                    style: context.textTheme.bodyText1?.copyWith(
                      color: Style.textColor,
                    ),
                  ),
                  Text(
                    '\$ 19.99',
                    style: context.textTheme.bodyText1?.copyWith(
                      color: Style.textColor,
                    ),
                  ),
                ],
              ).addPadding(EdgeInsets.symmetric(horizontal: widget.dimens.k15)),
            ),
          ),
          SizedBox(
            height: widget.dimens.k20,
          ),
        ],
      ).addPadding(EdgeInsets.all(widget.dimens.k15)),
    );
  }
}
