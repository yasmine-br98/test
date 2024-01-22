part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

class ProductLoadedSuccesfully extends ProductState {
  final List products;

  ProductLoadedSuccesfully({required this.products});
}

class CartProductLoadedSuccessfully extends ProductState {
  final List<CartProduct> cartProduct ;

  CartProductLoadedSuccessfully({required this.cartProduct});
}