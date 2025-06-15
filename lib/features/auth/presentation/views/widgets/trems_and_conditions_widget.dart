import 'package:flutter/material.dart';
import 'package:x/core/utils/app_colors.dart';
import 'package:x/core/utils/app_text_styles.dart';
import 'package:x/features/auth/presentation/views/widgets/custom_check_box.dart';


class TremsAndConditionsWidget extends StatefulWidget {
  const TremsAndConditionsWidget({super.key});

  @override
  State<TremsAndConditionsWidget> createState() => _TremsAndConditionsWidgetState();
}

class _TremsAndConditionsWidgetState extends State<TremsAndConditionsWidget> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChanged: (value){
            isTermsAccepted = value;
            setState(() {});
          },
          isChecked: isTermsAccepted,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب، فإنك توافق على ',
                  style: TextStyles.semiBold13.copyWith(
                    color: Color(0xFF949D9E),
                  ),
                ),
                TextSpan(
                  text: 'الشروط والأحكام',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
                TextSpan(text: ' ', style: TextStyles.semiBold13),
                TextSpan(
                  text: 'الخاصة',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
                TextSpan(text: ' ', style: TextStyles.semiBold13),
                TextSpan(
                  text: 'بنا',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
