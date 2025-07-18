import 'package:flutter/material.dart';
import 'package:x/features/auth/presentation/views/sign_in_view.dart';
import 'package:x/features/auth/presentation/views/signup_view.dart';
import 'package:x/features/best_selling_fruits/presentation/views/best_selling_view.dart';
import 'package:x/features/home/presentation/views/home_view.dart';
import 'package:x/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:x/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case SigninView.routeName:
      return MaterialPageRoute(builder: (context) => const SigninView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (context) => const BestSellingView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(
        builder: (context) =>
            const OnBoardingView(), // Replace with actual OnBoardingView
      );
    default:
      return MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: Text('Page not found'))),
        settings: settings,
      );
  }
}
