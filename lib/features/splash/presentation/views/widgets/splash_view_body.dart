import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x/constants.dart';
import 'package:x/core/services/shared_prefenrences_singleton.dart';
import 'package:x/core/utils/app_images.dart';
import 'package:x/features/auth/presentation/views/login_view.dart';
import 'package:x/features/on_boarding/presentation/views/on_boarding_view.dart';


class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [SvgPicture.asset(Assets.imagesPlant)],
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(fit: BoxFit.fill, Assets.imagesSplashBottom),
      ],
    );
  }

  void excuteNavigation() {
    bool isOnBoardingViewSeen =Prefs.instance.getBool(kIsOnBoardingViewSeen ); // Replace with your logic to check if the user has seen the onboarding view
    Future.delayed(const Duration(seconds: 3), () {
      if (isOnBoardingViewSeen) {
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }
}
