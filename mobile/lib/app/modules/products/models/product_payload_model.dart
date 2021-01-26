class ProductPayloadModel {
  String title;
  String description;
  double price;
  List<String> tags;

  ProductPayloadModel({this.title, this.description, this.price, this.tags});

  ProductPayloadModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    price = json['price'];
    tags = json['tags'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['tags'] = this.tags;
    return data;
  }
}
