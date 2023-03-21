import 'package:hive/hive.dart';

part 'book_content_model.g.dart';

@HiveType(typeId: 1)
class BookContentModel{
  @HiveField(0)
  String date;
  @HiveField(1)
  String textContent;
  BookContentModel(this.date, this.textContent);
}