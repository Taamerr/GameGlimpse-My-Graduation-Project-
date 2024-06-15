import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/cache_helper.dart';
import '../../../../../core/utils/functions/custom_snack_bar.dart';
import '../../../data/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo, this.context) : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  final BuildContext context;
  final AuthRepo authRepo;
  IconData passwordIcon = Icons.visibility_off;

  bool isHide = true;
  void changePasswordIcon() {
    isHide = !isHide;
    if (isHide == true) {
      passwordIcon = Icons.visibility_off;
    } else {
      passwordIcon = Icons.visibility;
    }
    emit(AuthChangePasswordIcon());
  }

  String name = '';
  String email = '';
  String password = '';

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(AuthRegisterLoadingState());
    var result = await authRepo.createUserWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
    );
    result.fold((failure) {
      emit(AuthRegisterFailureState(failure));
      showSnackBar(
        message: failure,
        context: context,
      );
    }, (userCredential) {
      emit(AuthRegisterSuccessState());
      showSnackBar(
        message: 'Register Successfully',
        context: context,
      );
    });
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(AuthLoginLoadingState());
    var result = await authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold((failure) {
      emit(AuthLoginFailureState(failure));
      showSnackBar(
        message: failure,
        context: context,
      );
    }, (userCredential) {
      emit(AuthLoginSuccessState());
      showSnackBar(
        message: 'Login Successfully',
        context: context,
      );
    });
  }

  Future<void> signInWithGoogle() async {
    emit(AuthLoginGoogleLoadingState());
    var result = await authRepo.signInWithGoogle();
    result.fold((failure) {
      emit(AuthLoginGoogleFailureState(failure));
      showSnackBar(
        message: failure,
        context: context,
      );
    }, (_) {
      emit(AuthLoginGoogleSuccessState());
      showSnackBar(
        message: 'Login Successfully',
        context: context,
      );
    });
  }

  void incognitoSignIn() {
    emit(AuthIncognitoUserLoadingState());
    CacheHelper.saveData(key: 'inco', value: true);
    emit(AuthIncognitoUserSuccessState());
  }
}
