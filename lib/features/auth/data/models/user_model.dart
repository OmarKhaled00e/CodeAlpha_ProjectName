import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:x/features/auth/domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.email, required super.uId});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? 'No Name',
      email: user.email ?? 'No Email',
      uId: user.uid,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      uId: json['uId'],
    );
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(name: user.name, email: user.email, uId: user.uId);
  }
  toMap() {
    return {'name': name, 'email': email, 'uId': uId};
  }
}
