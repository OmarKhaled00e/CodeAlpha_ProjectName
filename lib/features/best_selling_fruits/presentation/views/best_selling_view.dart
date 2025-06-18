import 'package:flutter/material.dart';
import 'package:x/core/utils/app_text_styles.dart';
import 'package:x/core/widgets/notification_widget.dart';
import 'package:x/features/best_selling_fruits/presentation/views/widgets/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const routeName = 'best_selling_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: BestSellingViewBody());
  }

  AppBar buildAppBar() {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: NotificationWidget(),
        ),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text('الأكثر مبيعًا', style: TextStyles.bold19),
    );
  }
}
