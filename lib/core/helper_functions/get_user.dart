import 'dart:convert';

import 'package:x/constants.dart';
import 'package:x/core/services/shared_prefenrences_singleton.dart';
import 'package:x/features/auth/data/models/user_model.dart';
import 'package:x/features/auth/domain/entites/user_entity.dart';

UserEntity getUser() {
  var jsonString = Prefs.getString(kUserData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
