import 'package:flutter/material.dart';
import 'package:x/core/utils/app_text_styles.dart';
import 'package:x/features/best_selling_fruits/presentation/views/best_selling_view.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, BestSellingView.routeName);
      },
      child: Row(
        children: [
          Text('الأكثر مبيعًا', style: TextStyles.bold16),
          Text(
            'المزيد',
            style: TextStyles.regular13.copyWith(color: Color(0xFF949D9E)),
          ),
        ],
      ),
    );
  }
}
