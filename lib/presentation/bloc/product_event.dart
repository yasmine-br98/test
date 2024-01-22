part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

class LoadProductsEvent extends ProductEvent {
  final int category;

  LoadProductsEvent({required this.category});
}

class LoadCartEvent extends ProductEvent {
  String? name;
  double? price;
  String? photo;
  String? description;

  LoadCartEvent({required this.name,required this.price,required this.photo,required this.description});
}

class GetCartProductEvent extends ProductEvent{}