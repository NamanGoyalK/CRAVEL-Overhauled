// ignore_for_file: use_build_context_synchronously

import 'package:cravel/widgets/salute_logo.dart';
import 'package:cravel/widgets/text_fields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_otp/email_otp.dart';

void main() {
  EmailOTP.config(
    appName: 'Cravel',
    otpType: OTPType.numeric,
    emailTheme: EmailTheme.v4,
  );
}

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class AuthClass {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // Stream<User?> get authStateChanges => _auth.authStateChanges();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> register(email, password) async {
    await auth.createUserWithEmailAndPassword(
        email: email.toString(), password: password.toString());
    // await auth.currentUser!.updateDisplayName(name.text);
  }
}

class _CreateAccountState extends State<CreateAccount> {
  bool passwordVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController otpController = TextEditingController();

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
                const Salutations(salute: 'Welcome!'),
                const InformativeText(informative: 'Create Account'),
                const LogoPicture(),
                InputField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'Email',
                  hintText: 'Enter Email',
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                verifyEmailButton(),
                InputField(
                  controller: otpController,
                  keyboardType:
                      const TextInputType.numberWithOptions(signed: false),
                  labelText: 'OTP',
                  hintText: 'Enter OTP',
                  prefixIcon: const Icon(Icons.message_outlined),
                ),
                optButton(context),
                InputField(
                  controller: passwordController,
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'Password',
                  hintText: 'Enter Password',
                  prefixIcon: const Icon(Icons.key_outlined),
                ),
                signUpButton(context),
                signInInsteadButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Align optButton(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () {
          EmailOTP.verifyOTP(otp: otpController.text);
          if (EmailOTP.getOTP() == otpController.text) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "OTP verified successfully",
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
          } else {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Invalid OTP",
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
          "Verify OTP",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 14,
            color: Color(0xff3a57e8),
          ),
          textAlign: TextAlign.start,
          overflow: TextOverflow.clip,
        ),
      ),
    );
  }

  Padding otpField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: TextField(
        controller: otpController,
        keyboardType: TextInputType.emailAddress,
        obscureText: false,
        textAlign: TextAlign.start,
        maxLines: 1,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          color: Color(0xff000000),
        ),
        decoration: InputDecoration(
          disabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(color: Color(0xff000000), width: 1),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(color: Color(0xff000000), width: 1),
          ),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(color: Color(0xff000000), width: 1),
          ),
          labelText: "OTP",
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 16,
            color: Color(0xff7c7878),
          ),
          hintText: "Enter OTP",
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 14,
            color: Color(0xff000000),
          ),
          helperText: "You have to verify email before setting up the password",
          filled: true,
          fillColor: const Color(0x00ffffff),
          isDense: false,
          contentPadding: const EdgeInsets.all(0),
        ),
      ),
    );
  }

  Text salutations() {
    return const Text(
      "Welcome !",
      textAlign: TextAlign.start,
      overflow: TextOverflow.clip,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontSize: 22,
        color: Color(0xff000000),
      ),
    );
  }

  Padding informativeText() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: Text(
        "Create Account",
        textAlign: TextAlign.start,
        overflow: TextOverflow.clip,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: 18,
          color: Color(0xffa29b9b),
        ),
      ),
    );
  }

  Padding logoPicture() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      child: Align(
        alignment: Alignment.center,
        child:

            ///*If you have exported images you must have to copy those images in assets/images directory.
            Image(
          image: AssetImage("assets/images/onlyLogo.png"),
          height: 150,
          width: 150,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Padding emailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: TextField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        obscureText: false,
        textAlign: TextAlign.start,
        maxLines: 1,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          color: Color(0xff000000),
        ),
        decoration: InputDecoration(
          disabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(color: Color(0xff000000), width: 1),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(color: Color(0xff000000), width: 1),
          ),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(color: Color(0xff000000), width: 1),
          ),
          labelText: "Email",
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 16,
            color: Color(0xff7c7878),
          ),
          hintText: "Enter Email",
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 14,
            color: Color(0xff000000),
          ),
          helperText:
              "This Email will be used to login and reset your password",
          filled: true,
          fillColor: const Color(0x00ffffff),
          isDense: false,
          contentPadding: const EdgeInsets.all(0),
        ),
      ),
    );
  }

  Padding passwordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
      child: TextField(
        controller: passwordController,
        obscureText: passwordVisible,
        textAlign: TextAlign.start,
        maxLines: 1,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          color: Color(0xff000000),
        ),
        decoration: InputDecoration(
            disabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: const BorderSide(color: Color(0xff000000), width: 1),
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: const BorderSide(color: Color(0xff000000), width: 1),
            ),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: const BorderSide(color: Color(0xff000000), width: 1),
            ),
            labelText: "Password",
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 16,
              color: Color(0xff7c7878),
            ),
            hintText: "Set a password",
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Color(0xff000000),
            ),
            helperText: "Password must be at least 6 characters long",
            filled: true,
            fillColor: const Color(0x00ffffff),
            isDense: false,
            contentPadding: const EdgeInsets.all(0),
            suffixIcon: IconButton(
              onPressed: () {
                setState(
                  () {
                    passwordVisible = !passwordVisible;
                  },
                );
              },
              icon: Icon(
                passwordVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: const Color(0xff7c7878),
              ),
            )),
      ),
    );
  }

  Align verifyEmailButton() {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: sendOTP,
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
          "Get OTP",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 14,
            color: Color(0xff3a57e8),
          ),
          textAlign: TextAlign.start,
          overflow: TextOverflow.clip,
        ),
      ),
    );
  }

  void sendOTP() async {
    if (emailController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Email cannot be empty")));
      return;
    }
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
        .hasMatch(emailController.text)) {
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
    }

    // FirebaseAuth.instance.currentEmail.sendEmailVerification();
    if (await EmailOTP.sendOTP(email: emailController.text)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("OTP has been sent")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Failed to send OTP")));
    }
  }

  Padding signUpButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: MaterialButton(
        onPressed: () async {
          if (EmailOTP.getOTP() == otpController.text) {
            if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                .hasMatch(emailController.text)) {
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
            } else if (passwordController.text.length < 6) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Password must be at least 6 characters",
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
                await AuthClass()
                    .register(emailController.text, passwordController.text);
                // FirebaseAuth.instance.email.sendEmailVerification();
                // await auth.currentUser!.updateDisplayName(name.text);
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Account created successfully",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color.fromARGB(255, 245, 245, 245),
                        ),
                      ),
                    ),
                  );
                  Navigator.of(context).pop();
                }
              } on FirebaseAuthException {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text('User already exists or invalid credentials!'),
                    ),
                  );
                }
              }
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Please verify OTP first.",
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
          "Sign up",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }

  signInInsteadButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: const Text(
        "Sign in instead !",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          color: Color(0xff3a57e8),
        ),
      ),
    );
  }
}
