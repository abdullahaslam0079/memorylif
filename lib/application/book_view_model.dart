import 'package:memorylif/ui/base/base_view_model.dart';


class BookViewModel extends BaseViewModel {
  String? todayContent;

  updateTodayContent({required String content}){
    todayContent = content;
    setState();
  }

}