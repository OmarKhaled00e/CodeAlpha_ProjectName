import 'package:dartz/dartz.dart';
import 'package:x/core/errors/exceptions.dart';
import 'package:x/core/errors/failures.dart';
import 'package:x/core/services/firebase_auth_service.dart';
import 'package:x/features/auth/data/models/user_model.dart';
import 'package:x/features/auth/domain/entites/user_entity.dart';
import 'package:x/features/auth/domain/repos/auth_repo.dart';

class AuthRepoIml extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  AuthRepoIml({required this.firebaseAuthService});
  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user));
    } on CustomExceptions catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ ما الرجاء المحوله مره اخري'));
    }
  }
}
