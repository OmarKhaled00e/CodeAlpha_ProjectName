import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:x/core/helper_functions/on_generate_routes.dart';
import 'package:x/core/services/shared_prefenrences_singleton.dart';
import 'package:x/features/splash/presentation/views/splash_view.dart';
import 'package:x/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Prefs().init();
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Cairo'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
