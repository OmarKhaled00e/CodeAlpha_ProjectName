import 'package:flutter/material.dart';
import 'package:x/constants.dart';
import 'package:x/core/utils/app_colors.dart';
import 'package:x/core/utils/app_images.dart';
import 'package:x/core/utils/app_text_styles.dart';
import 'package:x/core/widgets/custom_button.dart';
import 'package:x/core/widgets/custom_text_field.dart';
import 'package:x/features/auth/presentation/views/widgets/dont_have_account_widget.dart';
import 'package:x/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:x/features/auth/presentation/views/widgets/social_login_button.dart';


class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'كلمة المرور',
                textInputType: TextInputType.visiblePassword,
                suffixIcon: Icon(Icons.remove_red_eye, color: Color(0xffC9CECF)),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'نسيت كلمة المرور؟',
                    style: TextStyles.semiBold13.copyWith(
                      color: AppColors.lightPrimaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 33),
              CustomButton(onPressed: () {}, text: 'تسجيل دخول'),
              SizedBox(height: 33),
              DontHaveAnAccountwidget(),
              SizedBox(height: 33),
              OrDivider(),
              SizedBox(height: 16),
              SocialLoginButton(
                image: Assets.imagesGoogleIcon,
                title: 'تسجيل بواسطة جوجل',
                onPressed: (){},
              ),
              SizedBox(height: 16,),
              SocialLoginButton(
                image: Assets.imagesApplIcon,
                title: 'تسجيل بواسطة أبل',
                onPressed: (){},
              ),
              SizedBox(height: 16,),
              SocialLoginButton(
                image: Assets.imagesFacebookIcon,
                title: 'تسجيل بواسطة فيسبوك',
                onPressed: (){},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
