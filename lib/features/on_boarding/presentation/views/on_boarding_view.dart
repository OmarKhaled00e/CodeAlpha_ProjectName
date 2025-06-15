import 'package:flutter/material.dart';
import 'package:x/features/on_boarding/presentation/views/widgets/on_boarding_view_body.dart';


class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
static const String routeName = 'onBoarding';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: OnBoardingViewBody()),
    );
  }
}