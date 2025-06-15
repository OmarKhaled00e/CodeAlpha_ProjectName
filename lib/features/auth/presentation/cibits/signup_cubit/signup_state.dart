part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}
final class Signuploading extends SignupState {}
final class SignupSuccess extends SignupState {
  final UserEntity userEntity;

  SignupSuccess(this.userEntity);
}
final class SignupFailure extends SignupState {
  final String message;

  SignupFailure(this.message);
}
