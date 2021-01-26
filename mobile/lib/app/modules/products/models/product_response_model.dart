class ProductResponseModel {
  List<Product> products;

  ProductResponseModel({this.products});

  ProductResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = new List<Product>();
      json['products'].forEach((v) {
        products.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  List<String> tags;
  String sId;
  String title;
  String description;
  double price;
  int quantity;

  Product({
    this.tags,
    this.sId,
    this.title,
    this.description,
    this.price,
    this.quantity = 1,
  });

  Product.fromJson(Map<String, dynamic> json) {
    tags = json['tags']?.cast<String>();
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    price = json['price']?.toDouble();
    quantity = 1;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tags'] = this.tags;
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    return data;
  }

  Product copyWith({
    List<String> tags,
    String sId,
    String title,
    String description,
    double price,
    int quantity,
  }) {
    return Product(
      tags: tags ?? this.tags,
      sId: sId ?? this.sId,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Product &&
      o.sId == sId;
  }

  @override
  int get hashCode {
    return tags.hashCode ^
      sId.hashCode ^
      title.hashCode ^
      description.hashCode ^
      price.hashCode;
  }
}
