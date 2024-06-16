import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/cache_helper.dart';
import '../../../data/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo, this.context) : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  final BuildContext context;
  final AuthRepo authRepo;
  IconData passwordIcon = Icons.visibility;

  bool isHide = true;
  void changePasswordIcon() {
    isHide = !isHide;
    if (isHide == true) {
      passwordIcon = Icons.visibility;
    } else {
      passwordIcon = Icons.visibility_off;
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
    result.fold(
      (failure) {
        emit(AuthRegisterFailureState(failure));
      },
      (userCredential) async {
        emit(AuthRegisterSuccessState());
      },
    );
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
    }, (userCredential) {
      emit(AuthLoginSuccessState());
    });
  }

  Future<void> signInWithGoogle() async {
    emit(AuthLoginGoogleLoadingState());
    var result = await authRepo.signInWithGoogle();
    result.fold((failure) {
      emit(AuthLoginGoogleFailureState(failure));
    }, (_) {
      emit(AuthLoginGoogleSuccessState());
    });
  }

  void incognitoSignIn() {
    emit(AuthIncognitoUserLoadingState());
    CacheHelper.saveData(key: 'inco', value: true);
    emit(AuthIncognitoUserSuccessState());
  }

  Future<void> forgetPassword({required String email}) async {
    emit(AuthForgetPasswordLoadingState());
    try {
      if (email.isNotEmpty) {
        await authRepo.forgetPassword(email: email);
        emit(AuthForgetPasswordSuccessState());
      } else {
        emit(AuthForgetPasswordFailureState('Please Enter email first...'));
      }
    } catch (e) {
      emit(AuthForgetPasswordFailureState(e.toString()));
    }
  }

  Future<void> getUserData({required String uId}) async {
    emit(AuthGetUserDataLoadingState());
    var result = await authRepo.getUserData(uId: uId);
    result.fold((failure) {
      emit(AuthGetUserDataFailureState(failure));
    }, (_) {
      emit(AuthGetUserDataSuccessState());
    });
  }
}
