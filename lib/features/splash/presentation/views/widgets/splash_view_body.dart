import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x/constants.dart';
import 'package:x/core/services/firebase_auth_service.dart';
import 'package:x/core/services/shared_prefenrences_singleton.dart';
import 'package:x/core/utils/app_images.dart';
import 'package:x/features/auth/presentation/views/sign_in_view.dart';
import 'package:x/features/home/presentation/views/home_view.dart';
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
    var isOnBoardingViewSeen = Prefs.getBool(kIsOnBoardingViewSeen);
    Future.delayed(const Duration(seconds: 3), () {
      if (isOnBoardingViewSeen) {
        Navigator.pushReplacementNamed(context, SigninView.routeName);
        var isLoggedIn = FirebaseAuthService().isLoggedIn();
        if (isLoggedIn) {
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        } else {
          Navigator.pushReplacementNamed(context, SigninView.routeName);
        }
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }
}
