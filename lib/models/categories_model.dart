import 'package:yassmine_project/models/product_model.dart';

class Categories {
  String? title;
  List<Products>? products;

  Categories({this.title, this.products});

  Categories.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['Products'] != null) {
      products = <Products>[];
      json['Products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
      
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.products != null) {
      data['Products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
