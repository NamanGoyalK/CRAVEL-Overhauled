import 'package:cravel/Pages/front_page_main.dart';
import 'package:cravel/Pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthClass {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  get auth => null;
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cravel',
      theme: ThemeData.light(useMaterial3: true),
      home: StreamBuilder(
        stream: AuthClass().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePageMain();
          } else {
            return const Login();
          }
        },
      ),
    );
  }
}
