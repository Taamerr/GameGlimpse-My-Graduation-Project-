import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Future<Either<String, UserCredential>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });
  Future<Either<String, UserCredential>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<String, void>> signInWithGoogle();
  Future<void> userCreate({
    required String name,
    required String email,
    required String uId,
  });

  Future<Either<String, void>> getUserData({required String uId});

  Future<void> forgetPassword({
    required String email,
  });
}
