import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yassmine_project/core/routes/app_routes.dart';
import 'package:yassmine_project/core/theme/theme_helper.dart';
import 'package:yassmine_project/core/utils/image_constant.dart';
import 'package:yassmine_project/core/utils/size_utils.dart';
import 'package:yassmine_project/presentation/bloc/product_bloc.dart';
import 'package:yassmine_project/presentation/widgets/custom_search_view.dart';
import 'package:yassmine_project/presentation/widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key})
      : super(
          key: key,
        );

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();

  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(LoadProductsEvent(category: 0));
    tabviewController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        //toolbarHeight: 56.v,
        backgroundColor: Colors.white,
        leadingWidth: 22.h,
        leading: SvgPicture.asset(
          ImageConstant.imgMenu,
          fit: BoxFit.contain,
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.cartScreen);
            },
            child: Container(
              margin: EdgeInsets.only(
                top: 16.v,
                right: 13.h,
              ),
              child: SvgPicture.asset(
                ImageConstant.imgShoppingCart,
                height: 30.adaptSize,
                width: 30.adaptSize,
                //alignment: Alignment.bottomLeft,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.maxFinite,
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoadedSuccesfully) {
                return Column(
                  children: [
                    SizedBox(height: 34.v),
                    //! Title
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 185.h,
                        margin: EdgeInsets.only(left: 50.h),
                        child: Text(
                          "Delicious \nfood for you",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.displaySmall,
                        ),
                      ),
                    ),
                    SizedBox(height: 21.v),

                    //! Search
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.h),
                      child: CustomSearchView(
                        controller: searchController,
                        hintText: "Search",
                      ),
                    ),
                    SizedBox(height: 39.v),

                    _buildTabview(context),

                    SizedBox(
                      height: 521.v,
                      child: TabBarView(
                        controller: tabviewController,
                        children: [
                          ProductCard(products: state.products),
                          ProductCard(products: state.products),
                          ProductCard(products: state.products),
                          ProductCard(products: state.products),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return SizedBox(
      height: 33.v,
      width: 350.h,
      child: TabBar(
        controller: tabviewController,
        labelPadding: EdgeInsets.zero,
        labelColor: theme.colorScheme.primary,
        labelStyle: TextStyle(
          fontSize: 17.fSize,
          fontFamily: 'SF Pro Text',
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelColor: appTheme.gray500,
        unselectedLabelStyle: TextStyle(
          fontSize: 17.fSize,
          fontFamily: 'SF Pro Text',
          fontWeight: FontWeight.w400,
        ),
        indicatorColor: theme.colorScheme.primary,
        onTap: (value) {
          //print(value);
          final cat = ["Foods", "Drinks", "Snacks", "Pizzas"];
          context.read<ProductBloc>().add(LoadProductsEvent(category: value));
          //setState(() {});
        },
        tabs: const [
          Tab(
            child: Text(
              "Foods",
            ),
          ),
          Tab(
            child: Text(
              "Drinks",
            ),
          ),
          Tab(
            child: Text(
              "Snacks",
            ),
          ),
          Tab(
            child: Text(
              "Pizzas",
            ),
          ),
        ],
      ),
    );
  }
}
