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
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> signIn(email, password) async {
    await auth.signInWithEmailAndPassword(
        email: email.toString(), password: password.toString());
  }

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Salutations(
                  salute: 'Welcome Back!',
                ),
                const InformativeText(
                  informative: 'Login to Continue',
                ),
                const LogoPicture(),
                emailInput(),
                passwordInput(),
                forgotButton(context),
                loginButton(context),
                createAccountButton(context),
                or(),
                googleIcon()
              ],
            ),
          ),
        ),
      ),
    );
  }

  PasswordField passwordInput() {
    return PasswordField(
      password: password,
      passwordVisible: passwordVisible,
      suffixIcon: IconButton(
        icon: Icon(passwordVisible
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined),
        onPressed: () {
          setState(
            () {
              passwordVisible = !passwordVisible;
            },
          );
        },
      ),
    );
  }

  InputField emailInput() {
    return InputField(
      controller: email,
      keyboardType: TextInputType.emailAddress,
      labelText: 'Email',
      hintText: 'Enter Email',
    );
  }

  Padding or() {
    return const Padding(
      padding: EdgeInsets.all(4.0),
      child: Text(
        'or',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          color: Color(0xff3a57e8),
        ),
      ),
    );
  }

  ElevatedButton googleIcon() {
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

          await FirebaseAuth.instance.signInWithCredential(credential);
        } on Exception /*catch (e)*/ {
          // print('exception->$e');
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Could not sign in with google please use email instead",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color.fromARGB(255, 245, 245, 245),
                  ),
                ),
              ),
            );
          }
        }
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color.fromARGB(255, 245, 245, 245),
        backgroundColor: const Color.fromARGB(44, 247, 247, 248),
        side: const BorderSide(
          width: 1,
          color: Colors.black,
        ),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: const EdgeInsets.all(15),
        // textColor: const Color(0xff3a57e8),
        // height: 50,
        // minWidth: MediaQuery.of(context).size.width,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/google_icon.png",
            height: 18,
            width: 18,
          ),
          const Text(
            '  Continue with ',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          const Text(
            'Google',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          )
        ],
      ),
    );
  }

  Align forgotButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ForgotPassword(),
            ),
          );
        },
        style: ButtonStyle(
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.focused)) {
                return const Color(0x1f000000);
              }
              if (states.contains(WidgetState.hovered)) {
                return const Color(0x0a000000);
              }
              if (states.contains(WidgetState.pressed)) {
                return const Color(0x0d000000);
              }
              return null;
            },
          ),
        ),
        child: const Text(
          "Forgot Password?",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 14,
            color: Color.fromARGB(255, 51, 81, 231),
          ),
          textAlign: TextAlign.start,
          overflow: TextOverflow.clip,
        ),
      ),
    );
  }

  TextButton forgotPasswordButton() {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.focused)) {
              return const Color(0x1f000000);
            }
            if (states.contains(WidgetState.hovered)) {
              return const Color(0x0a000000);
            }
            if (states.contains(WidgetState.pressed)) {
              return const Color(0x0d000000);
            }
            return null;
          },
        ),
      ),
      child: const Text(
        "Forgot Password?",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          color: Color.fromARGB(255, 53, 84, 240),
        ),
        textAlign: TextAlign.start,
        overflow: TextOverflow.clip,
      ),
    );
  }

  MaterialButton createAccountButton(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CreateAccount(),
          ),
        );
      },
      color: const Color(0x2d3a57e8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: const EdgeInsets.all(15),
      textColor: const Color(0xff3a57e8),
      height: 50,
      minWidth: MediaQuery.of(context).size.width,
      child: const Text(
        "Create account",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }

  Padding loginButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 25, 0, 10),
      child: MaterialButton(
        onPressed: () async {
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(email.text)) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Enter a valid email",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color.fromARGB(255, 245, 245, 245),
                  ),
                ),
              ),
            );
          } else {
            try {
              await signIn(email.text, password.text);
            } on FirebaseAuthException {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Invalid email or password'),
                  ),
                );
              }
            }
          }
        },
        color: const Color(0xff3a57e8),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: const EdgeInsets.all(16),
        textColor: const Color(0xffffffff),
        height: 50,
        minWidth: MediaQuery.of(context).size.width,
        child: const Text(
          "Login",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }
}
