import 'package:flutter/material.dart';
import 'package:yassmine_project/core/theme/app_decoration.dart';
import 'package:yassmine_project/core/theme/custom_text_style.dart';
import 'package:yassmine_project/core/theme/theme_helper.dart';
import 'package:yassmine_project/core/utils/image_constant.dart';
import 'package:yassmine_project/core/utils/size_utils.dart';
import 'package:yassmine_project/models/cart_prodect_model.dart';
import 'package:yassmine_project/presentation/widgets/custom_image_view.dart';

// ignore: must_be_immutable
class ProductcardlistItemWidget extends StatefulWidget {
  const ProductcardlistItemWidget({Key? key, required this.cartProduct})
      : super(
          key: key,
        );
  final CartProduct cartProduct;
  @override
  State<ProductcardlistItemWidget> createState() =>
      _ProductcardlistItemWidgetState();
}

class _ProductcardlistItemWidgetState extends State<ProductcardlistItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.v),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 69.adaptSize,
            width: 69.adaptSize,
            margin: EdgeInsets.symmetric(vertical: 9.v),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgBiCreditCard2FrontFill,
                  height: 16.adaptSize,
                  width: 16.adaptSize,
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 6.h),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgImage269x69,
                  height: 69.adaptSize,
                  width: 69.adaptSize,
                  radius: BorderRadius.circular(
                    34.h,
                  ),
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 21.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.cartProduct.name!,
                  style: CustomTextStyles.titleMediumBlack900_1,
                ),
                SizedBox(height: 2.v),
                Text(
                  "${widget.cartProduct.price!} DT",
                  style: theme.textTheme.titleSmall,
                ),
                SizedBox(height: 5.v),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 11.h),
                    decoration: AppDecoration.fillPrimary.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 2.h,
                            top: 1.v,
                          ),
                          child: Text(
                            "${widget.cartProduct.qte!}",
                            style: CustomTextStyles.titleSmallGray10001,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 13.h,
                            top: 1.v,
                          ),
                          child: Text(
                            "${widget.cartProduct.qte!}",
                            style: theme.textTheme.labelLarge,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 13.h,
                            top: 4.v,
                            bottom: 3.v,
                          ),
                          child: Text(
                            "+",
                            style: theme.textTheme.labelMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
