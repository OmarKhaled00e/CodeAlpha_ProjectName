import 'package:flutter/material.dart';
import 'package:x/features/auth/presentation/views/login_view.dart';
import 'package:x/features/auth/presentation/views/signup_view.dart';
import 'package:x/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:x/features/splash/presentation/views/splash_view.dart';


Route<dynamic> onGenerateRoute(RouteSettings settings){
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(
        builder: (context) => const SplashView(),
      );
    case LoginView.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginView(),
      );
    case SignupView.routeName:
      return MaterialPageRoute(
        builder: (context) => const SignupView(),
      );
    case OnBoardingView.routeName:
      return MaterialPageRoute(
        builder: (context) => const OnBoardingView(), // Replace with actual OnBoardingView
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text('Page not found')),
        ),
        settings: settings,
      );
  }
}