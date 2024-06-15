part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthRegisterLoadingState extends AuthState {}

final class AuthRegisterSuccessState extends AuthState {}

final class AuthRegisterFailureState extends AuthState {
  final String errMessage;

  AuthRegisterFailureState(this.errMessage);
}

final class AuthLoginLoadingState extends AuthState {}

final class AuthLoginSuccessState extends AuthState {}

final class AuthLoginFailureState extends AuthState {
  final String errMessage;

  AuthLoginFailureState(this.errMessage);
}

final class AuthLoginGoogleLoadingState extends AuthState {}

final class AuthLoginGoogleSuccessState extends AuthState {}

final class AuthLoginGoogleFailureState extends AuthState {
  final String errMessage;

  AuthLoginGoogleFailureState(this.errMessage);
}

final class AuthIncognitoUserLoadingState extends AuthState {}

final class AuthIncognitoUserSuccessState extends AuthState {}

final class AuthChangePasswordIcon extends AuthState {}

final class AuthForgetPasswordLoadingState extends AuthState {}

final class AuthForgetPasswordSuccessState extends AuthState {}

final class AuthForgetPasswordFailureState extends AuthState {
  final String errMessage;

  AuthForgetPasswordFailureState(this.errMessage);
}
