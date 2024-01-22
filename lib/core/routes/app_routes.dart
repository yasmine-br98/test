import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yassmine_project/presentation/bloc/product_bloc.dart';
import 'package:yassmine_project/presentation/pages/cart_screen.dart';
import 'package:yassmine_project/presentation/pages/home_tab_container_screen.dart';

class AppRoutes {
  static const String homePage = '/home_page';

  static const String cartScreen = '/cart_screen';

  static Map<String, WidgetBuilder> routes = {
    homePage: (context) => BlocProvider(
          create: (context) => ProductBloc(),
          child: const HomePage(),
        ),
    cartScreen: (context) => BlocProvider(
          create: (context) => ProductBloc(),
          child: const CartScreen(),
        ),
  };
}
