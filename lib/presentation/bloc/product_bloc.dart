import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:yassmine_project/models/cart_prodect_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    int qte = 0;
    List<CartProduct> cartProduct = [];
    on<ProductEvent>((event, emit) async {
      if (event is LoadProductsEvent) {
        String response = await rootBundle.loadString("assets/data/data.json");
        final data = await json.decode(response);
        emit(ProductLoadedSuccesfully(
            products: data["categories"][event.category]["Products"]));
      }
      if (event is LoadCartEvent) {
        print("event: $event");

        qte += 1;
        CartProduct prd = CartProduct(
            name: event.name,
            price: event.price,
            photo: event.photo,
            description: event.description,
            qte: qte);
        cartProduct.add(prd);
      }
      if (event is GetCartProductEvent) {
        emit(CartProductLoadedSuccessfully(cartProduct: cartProduct));
      }
    });
  }
}
