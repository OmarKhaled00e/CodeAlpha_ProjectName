import 'package:dartz/dartz.dart';
import 'package:x/core/errors/failures.dart';
import 'package:x/features/auth/domain/entites/user_entity.dart';

abstract class AuthRepo {

  Future<Either<Failures , UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
    
  );
}