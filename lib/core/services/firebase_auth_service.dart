import 'package:firebase_auth/firebase_auth.dart';
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
      if (e.code == 'weak-password') {
        throw CustomExceptions('الرقم السري ضعيف جداً.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExceptions( 'لقد تم تسجيل هذا البريد الإلكتروني بالفعل.');
      }else{
        throw CustomExceptions('لقد حدث خطأ أثناء إنشاء الحساب: ${e.message}');
      }
    } catch (e) {
      throw CustomExceptions('لقد حدث خطأ ما الرجاء المحوله مره اخري');
    }
  
  }
}
