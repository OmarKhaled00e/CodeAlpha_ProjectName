import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x/core/utils/app_images.dart';
import 'package:x/core/utils/app_text_styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'ابحث عن.......',
          fillColor: Colors.white,
          hintStyle: TextStyles.regular13.copyWith(
            color: const Color(0xFF949D9E),
          ),
          prefixIcon: SizedBox(
            width: 20,

            child: Center(child: SvgPicture.asset(Assets.imagesSearchIcon)),
          ),
          suffixIcon: SizedBox(
            width: 20,
            child: Center(child: SvgPicture.asset(Assets.imagesFilter)),
          ),
          filled: true,
          border: buildBorder(),
          enabledBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(width: 1, color: Colors.white),
    );
  }
}
