import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yassmine_project/core/theme/app_decoration.dart';
import 'package:yassmine_project/core/theme/custom_text_style.dart';
import 'package:yassmine_project/core/theme/theme_helper.dart';
import 'package:yassmine_project/core/utils/size_utils.dart';
import 'package:yassmine_project/presentation/bloc/product_bloc.dart';
import 'package:yassmine_project/presentation/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class ProductCard extends StatefulWidget {
  const ProductCard({Key? key, required this.products})
      : super(
          key: key,
        );
  final List products;
  @override
  ProductCardState createState() => ProductCardState();
}

class ProductCardState extends State<ProductCard>
    with AutomaticKeepAliveClientMixin<ProductCard> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        decoration: AppDecoration.fillGray,
        child: Column(
          children: [
            SizedBox(height: 30.v),
            _buildProductCard(context, widget.products),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildProductCard(BuildContext context, List products) {
    return Align(
      alignment: Alignment.topRight,
      child: SizedBox(
        height: 352.v,
        child: ListView.separated(
          padding: EdgeInsets.only(left: 50.h),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              width: 34.h,
            );
          },
          itemCount: products.length,
          itemBuilder: (context, index) {
            return SizedBox(
              width: 220.h,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.h,
                  vertical: 10.v,
                ),
                decoration: AppDecoration.outlineGray.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder30,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //NetworkImage.assets(products[index].photo,),
                    Image.network(
                      products[index]["photo"],
                      height: 174.v,
                      width: 164.h,
                    ),

                    SizedBox(height: 32.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Opacity(
                        opacity: 0.9,
                        child: Container(
                          width: 110.h,
                          margin: EdgeInsets.only(left: 27.h),
                          child: Text(
                            products[index]["name"],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.titleLargeBlack900.copyWith(
                              height: 1.01,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.v),
                    Text(
                      "${products[index]["price"]} DT",
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 14.v),
                    // Container(
                    //   width: 131.h,
                    //   height: 31.v,
                    //   decoration: const BoxDecoration(),
                    // ),
                    CustomElevatedButton(
                      width: 131.h,
                      text: "-",
                      rightIcon: InkWell(
                          onTap: () {
                            //print("t");
                            context.read<ProductBloc>().add(LoadCartEvent(name:  products[index]["name"], photo:  products[index]["photo"],
                            price:  products[index]["price"], description:  products[index]["description"] ));
                          },
                          child: const Icon(Icons.add)),
                      leftIcon: const Icon(Icons.remove),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
