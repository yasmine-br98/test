import 'package:flutter/material.dart';
import 'package:yassmine_project/core/utils/size_utils.dart';
import 'package:yassmine_project/presentation/widgets/custom_image_view.dart';

// ignore: must_be_immutable
class AppbarLeadingImage extends StatelessWidget {
  AppbarLeadingImage({
    Key? key,
    this.imagePath,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String? imagePath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(
          imagePath: imagePath,
          height: 14.v,
          width: 22.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
