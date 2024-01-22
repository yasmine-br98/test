
class Products {
  String? name;
  double? price;
  String? photo;
  String? description;

  Products({this.name, this.price, this.photo, this.description});

  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    photo = json['photo'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['photo'] = this.photo;
    data['description'] = this.description;
    return data;
  }
}
