import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x/core/helper_functions/build_error_bar.dart';
import 'package:x/core/widgets/custom_progress_hud.dart';
import 'package:x/features/auth/presentation/cibits/cubit/signin_cubit.dart';
import 'package:x/features/auth/presentation/views/widgets/signin_view_body.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          // Handle success state, e.g., navigate to home screen
        }
        if (state is SigninFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SigninLoading ? true : false,

          child: SigninViewBody(),
        );
      },
    );
  }
}
