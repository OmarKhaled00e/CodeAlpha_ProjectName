import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x/core/utils/app_colors.dart';
import 'package:x/core/utils/app_text_styles.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.text, required this.image});
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16),
      decoration: ShapeDecoration(
        color: Color(0xFFEEEEEE),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: 30,
              height: 30,
              decoration: ShapeDecoration(
                color: AppColors.primaryColor,
                shape: OvalBorder(),
              ),
              child: Center(child: SvgPicture.asset(image)),
            ),
          ),
          SizedBox(width: 4),
          Text(
            text,
            style: TextStyles.semiBold11.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
