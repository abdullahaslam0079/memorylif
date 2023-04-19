class UserModel {
  String? name;
  String? email;
  bool? isPremiumUser;
  bool? hasOrderedBook;


  UserModel(
      {this.name,
        this.email,
        this.isPremiumUser,
        this.hasOrderedBook,
      });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    isPremiumUser = json['isPremiumUser']?? false;
    hasOrderedBook = json['hasOrderedBook'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['isPremiumUser'] = isPremiumUser;
    data['hasOrderedBook'] = hasOrderedBook;
    return data;
  }
}