import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yassmine_project/core/theme/custom_button_style.dart';
import 'package:yassmine_project/core/theme/custom_text_style.dart';
import 'package:yassmine_project/core/theme/theme_helper.dart';
import 'package:yassmine_project/core/utils/image_constant.dart';
import 'package:yassmine_project/core/utils/size_utils.dart';
import 'package:yassmine_project/models/cart_prodect_model.dart';
import 'package:yassmine_project/presentation/bloc/product_bloc.dart';
import 'package:yassmine_project/presentation/widgets/app_bar/appbar_title.dart';
import 'package:yassmine_project/presentation/widgets/app_bar/custom_app_bar.dart';
import 'package:yassmine_project/presentation/widgets/custom_elevated_button.dart';

import '../widgets/productcardlist_item_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(GetCartProductEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appTheme.gray100,
        appBar: _buildAppBar(context),
        body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
          //print(products);
          if (state is CartProductLoadedSuccessfully) {
            return Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 49.h, vertical: 27.v),
                child: Column(children: [
                  SizedBox(height: 50.v),
                  _buildProductCardList(context, state.cartProduct),
                  const Spacer(),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total",
                                style: CustomTextStyles
                                    .titleMediumSFProTextOnPrimaryContainer),
                            Text("32.7 DT",
                                style: CustomTextStyles.titleMediumSFProText)
                          ]))
                ]));
          }
          return const Center();
        }),
        bottomNavigationBar: _buildCompleteOrderButton(context));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 30.h,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(ImageConstant.imgArrowLeft)),
        centerTitle: true,
        title: AppbarTitle(text: "Cart"));
  }

  /// Section Widget
  Widget _buildProductCardList(
      BuildContext context, List<CartProduct> cartProduct) {
    return Padding(
        padding: EdgeInsets.only(left: 1.h),
        child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 19.v);
            },
            itemCount: cartProduct.length,
            itemBuilder: (context, index) {
              return ProductcardlistItemWidget(cartProduct: cartProduct[index]);
            }));
  }

  /// Section Widget
  Widget _buildCompleteOrderButton(BuildContext context) {
    return CustomElevatedButton(
        height: 70.v,
        text: "Complete order",
        margin: EdgeInsets.only(left: 50.h, right: 50.h, bottom: 41.v),
        buttonStyle: CustomButtonStyles.fillPrimaryTL30,
        buttonTextStyle: CustomTextStyles.titleMediumSFProTextGray10002);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
