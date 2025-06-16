import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:x/core/errors/exceptions.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'FirebaseAuthException in createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code}',
      );
      if (e.code == 'weak-password') {
        throw CustomExceptions('الرقم السري ضعيف جداً.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExceptions('لقد تم تسجيل هذا البريد الإلكتروني بالفعل.');
      } else if (e.code == 'network-request-failed') {
        throw CustomExceptions('لا يوجد اتصال بالإنترنت.');
      } else if (e.code == 'invalid-email') {
        throw CustomExceptions('البريد الإلكتروني غير صالح.');
      } else {
        throw CustomExceptions('لقد حدث خطأ أثناء إنشاء الحساب: ${e.message}');
      }
    } catch (e) {
      log('Exception in createUserWithEmailAndPassword: ${e.toString()}');
      throw CustomExceptions('لقد حدث خطأ ما الرجاء المحوله مره اخري');
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'FirebaseAuthException in signInWithEmailAndPassword: ${e.toString()} and code is ${e.code}',
      );
      if (e.code == 'user-not-found') {
        throw CustomExceptions('المستخدم غير موجود.');
      } else if (e.code == 'wrong-password') {
        throw CustomExceptions(
          'كلمة المرور غير صحيحة.او البريد لالكتروني غير صحيح.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomExceptions('لا يوجد اتصال بالإنترنت.');
      } else if (e.code == 'invalid-email') {
        throw CustomExceptions('البريد الإلكتروني غير صالح.');
      } else {
        throw CustomExceptions('لقد حدث خطأ أثناء تسجيل الدخول: ${e.message}');
      }
    } catch (e) {
      log('Exception in signInWithEmailAndPassword: ${e.toString()}');
      throw CustomExceptions('لقد حدث خطأ ما الرجاء المحوله مره اخري');
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    return (await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)).user!;
  }
}
