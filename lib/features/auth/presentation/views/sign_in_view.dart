import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x/core/services/get_it_service.dart';
import 'package:x/core/widgets/custom_app_bar.dart';
import 'package:x/features/auth/domain/repos/auth_repo.dart';
import 'package:x/features/auth/presentation/cibits/cubit/signin_cubit.dart';
import 'package:x/features/auth/presentation/views/widgets/signin_view_body_bloc_Consumer.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});
  static const String routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'تسجيل دخول'),
        body: SigninViewBodyBlocConsumer(),
      ),
    );
  }
}

