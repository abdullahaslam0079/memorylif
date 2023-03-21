class ContentModel {
  String? date;
  String? textContent;


  ContentModel(
      {this.date,
        this.textContent,
      });

  ContentModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    textContent = json['textContent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['textContent'] = textContent;
    return data;
  }
}