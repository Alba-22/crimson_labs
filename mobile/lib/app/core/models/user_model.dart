class UserModel {
  String id;
  String name;
  String email;
  String country;

  UserModel({this.id, this.name, this.email, this.country});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['country'] = this.country;
    return data;
  }
}