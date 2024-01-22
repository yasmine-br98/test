import 'package:flutter/material.dart';
import 'package:yassmine_project/core/theme/custom_text_style.dart';
import 'package:yassmine_project/core/theme/theme_helper.dart';

// ignore: must_be_immutable
class AppbarTitle extends StatelessWidget {
  AppbarTitle({
    Key? key,
    required this.text,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String text;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          style: CustomTextStyles.titleMediumSFProTextBlack900.copyWith(
            color: appTheme.black900,
          ),
        ),
      ),
    );
  }
}
