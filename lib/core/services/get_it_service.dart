import 'package:get_it/get_it.dart';
import 'package:x/core/services/firebase_auth_service.dart';
import 'package:x/features/auth/data/repos/auth_repo_iml.dart';
import 'package:x/features/auth/domain/repos/auth_repo.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(AuthRepoIml(firebaseAuthService: getIt<FirebaseAuthService>()));
}
