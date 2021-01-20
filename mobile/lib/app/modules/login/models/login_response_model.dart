class LoginResponseModel {
  String id;
  String token;
  String message;
  List<String> errors;

  LoginResponseModel({this.id ,this.token, this.message, this.errors});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
    message = json['message'];
    errors = json['errors']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['token'] = this.token;
    data['message'] = this.message;
    data['errors'] = this.errors;
    return data;
  }
}
