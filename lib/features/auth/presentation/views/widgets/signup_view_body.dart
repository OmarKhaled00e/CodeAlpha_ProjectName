import 'package:flutter/material.dart';
import 'package:x/constants.dart';
import 'package:x/core/widgets/custom_button.dart';
import 'package:x/core/widgets/custom_text_field.dart';
import 'package:x/features/auth/presentation/views/widgets/have_an_account_widget.dart';
import 'package:x/features/auth/presentation/views/widgets/trems_and_conditions_widget.dart';


class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Column(
          children: [
            SizedBox(height: 24),
            CustomTextFormField(
              hintText: 'الاسم كامل',
              textInputType: TextInputType.name,
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'البريد الإلكتروني',
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              suffixIcon: Icon(Icons.remove_red_eye, color: Color(0xffC9CECF)),
              hintText: 'كلمة المرور',
              textInputType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 16),
            TremsAndConditionsWidget(),
            SizedBox(height: 30),
            CustomButton(onPressed: () {}, text: ' إنشاء حساب جديد'),
            SizedBox(height: 26),
            HaveAnAccountWidget(),
          ],
        ),
      ),
    );
  }
}
