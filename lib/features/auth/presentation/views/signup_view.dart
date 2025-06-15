import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x/core/services/get_it_service.dart';

import 'package:x/core/widgets/custom_app_bar.dart';
import 'package:x/features/auth/domain/repos/auth_repo.dart';
import 'package:x/features/auth/presentation/cibits/signup_cubit/signup_cubit.dart';
import 'package:x/features/auth/presentation/views/widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const String routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'حساب جديد'),
        body: SignupViewBody()
      ),
    );
  }
}