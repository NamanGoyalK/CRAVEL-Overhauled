import 'package:cravel/Pages/create_account.dart';
import 'package:cravel/Pages/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cravel/widgets/salute_logo.dart';
import 'package:cravel/widgets/text_fields.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class AuthClass {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get authStateChanges => _auth.authStateChanges();
}

class _LoginState extends State<Login> {
  bool passwordVisible = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  Future<void> signIn(String email, String password) async {
    await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Salutations(salute: 'Welcome Back!'),
                const InformativeText(informative: 'Login to Continue'),
                const LogoPicture(),
                emailInput(),
                passwordInput(),
                forgotPasswordButton(context),
                loginButton(context),
                createAccountButton(context),
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    'or',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xff3a57e8),
                    ),
                  ),
                ),
                googleLoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PasswordField passwordInput() {
    return PasswordField(
      password: passwordController,
      passwordVisible: passwordVisible,
      suffixIcon: IconButton(
        icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
        onPressed: () {
          setState(() {
            passwordVisible = !passwordVisible;
          });
        },
      ),
    );
  }

  InputField emailInput() {
    return InputField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      labelText: 'Email',
      hintText: 'Enter Email',
      prefixIcon: const Icon(Icons.email_outlined),
    );
  }

  ElevatedButton googleLoginButton() {
    return ElevatedButton(
      onPressed: () async {
        try {
          final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
          final GoogleSignInAuthentication? googleAuth =
              await googleUser?.authentication;

          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken,
            idToken: googleAuth?.idToken,
          );

          await auth.signInWithCredential(credential);
        } catch (e) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text(
                      "Could not sign in with Google. Please use email instead.")),
            );
          }
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(44, 247, 247, 248),
        side: const BorderSide(width: 1, color: Colors.black),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: const EdgeInsets.all(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/google_icon.png", height: 18, width: 18),
          const SizedBox(width: 8),
          const Text('Continue with Google',
              style: TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Align forgotPasswordButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ForgotPassword()),
          );
        },
        child: const Text(
          "Forgot Password?",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Color(0xff3a57e8)),
        ),
      ),
    );
  }

  MaterialButton createAccountButton(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CreateAccount()),
        );
      },
      color: const Color(0x2d3a57e8),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      padding: const EdgeInsets.all(15),
      textColor: const Color(0xff3a57e8),
      height: 50,
      minWidth: MediaQuery.of(context).size.width,
      child: const Text(
        "Create account",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    );
  }

  Padding loginButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 25, 0, 10),
      child: MaterialButton(
        onPressed: () async {
          final email = emailController.text.trim();
          final password = passwordController.text;

          if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\.[a-z]")
              .hasMatch(email)) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Enter a valid email")));
          } else {
            try {
              await signIn(email, password);
            } on FirebaseAuthException {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Invalid email or password')));
              }
            }
          }
        },
        color: const Color(0xff3a57e8),
        elevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        padding: const EdgeInsets.all(16),
        textColor: Colors.white,
        height: 50,
        minWidth: MediaQuery.of(context).size.width,
        child: const Text("Login",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
      ),
    );
  }
}
