import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:x/core/errors/exceptions.dart';
import 'package:x/core/errors/failures.dart';
import 'package:x/core/services/database_service.dart';
import 'package:x/core/services/firebase_auth_service.dart';
import 'package:x/core/utils/backend_endpoint.dart';
import 'package:x/features/auth/data/models/user_model.dart';
import 'package:x/features/auth/domain/entites/user_entity.dart';
import 'package:x/features/auth/domain/repos/auth_repo.dart';

class AuthRepoIml extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;
  AuthRepoIml({
    required this.databaseService,
    required this.firebaseAuthService,
  });
  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(name: name, email: email, uId: user.uid);

      var isUserExist = await databaseService.checkIfDataExists(
        path: BackendEndpoint.isUserExists,
        documentId: user.uid,
      );
      if (isUserExist) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }

      return right(userEntity);
    } on CustomExceptions catch (e) {
      await deletUser(user);
      return Left(ServerFailure(e.message));
    } catch (e) {
      await deletUser(user);
      log('Exsption in createUserWithEmailAndPassword: ${e.toString()}');
      return Left(ServerFailure('حدث خطأ ما الرجاء المحوله مره اخري'));
    }
  }

  Future<void> deletUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deletUser();
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = await getUserData(uid: user.uid);
      var isUserExist = await databaseService.checkIfDataExists(
        path: BackendEndpoint.isUserExists,
        documentId: user.uid,
      );
      if (isUserExist) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }

      return right(userEntity);
    } on CustomExceptions catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Exsption in signInWithEmailAndPassword: ${e.toString()}');
      return Left(ServerFailure('حدث خطأ ما الرجاء المحوله مره اخري'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();

      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExist = await databaseService.checkIfDataExists(
        path: BackendEndpoint.isUserExists,
        documentId: user.uid,
      );
      if (isUserExist) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } catch (e) {
      await deletUser(user);

      log('Exsption in signInWithGoogle: ${e.toString()}');
      return Left(ServerFailure('حدث خطأ ما الرجاء المحوله مره اخري'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> singInWithFacebooK() async {
    User? user;
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(user: userEntity);
      var isUserExist = await databaseService.checkIfDataExists(
        path: BackendEndpoint.isUserExists,
        documentId: user.uid,
      );
      if (isUserExist) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } catch (e) {
      await deletUser(user);
      log(
        'Expcption in AuthRepo. createUserWithEmailAndPrassword: ${e.toString} ',
      );
      return left(ServerFailure('حدث خطأ ما الرجاء المحاولة مؤة اخري'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEndpoint.addUserData,
      data: user.toMap(),
      documentId: user.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var userData = await databaseService.getData(
      path: BackendEndpoint.getUserData,
      docuemntId: uid,
    );
    return UserModel.fromJson(userData);
  }
}
