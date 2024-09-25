// import 'package:cravel/Pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final auth = FirebaseAuth.instance;

Future<void> signOut() async {
  await auth.signOut();
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: titleBar(),
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
                logoPicture(),
                allTextFields(),
                passwordField(),
                logOutButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar titleBar() {
    return AppBar(
      backgroundColor: const Color(0xffffffff),
      elevation: 0,
      centerTitle: true,
      title: const Text(
        'User Profile',
        style: TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 30,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }

  Column allTextFields() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: textInput(
            labelText: "Name",
            assignedText: 'Naman Goyal',
            keyboardType: TextInputType.name,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: textInput(
            labelText: "Username",
            assignedText: 'naman2028',
            keyboardType: TextInputType.name,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: textInput(
            labelText: "Phone Number",
            assignedText: '7009XXXXX9',
            keyboardType: TextInputType.phone,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: textInput(
            labelText: "Email",
            assignedText: "namangoyaltms@outlook.com",
            keyboardType: TextInputType.emailAddress,
          ),
        ),
      ],
    );
  }

  Text salutations() {
    return const Text(
      "User Profile",
      textAlign: TextAlign.start,
      overflow: TextOverflow.clip,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontSize: 32,
        color: Color(0xff000000),
      ),
    );
  }

  Padding logoPicture() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: Align(
        child: Image(
          image: AssetImage("assets/images/onlyLogo.png"),
          height: 150,
          width: 150,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  TextField textInput(
      {required String labelText, assignedText, required var keyboardType}) {
    return TextField(
      readOnly: true,
      controller: TextEditingController(text: assignedText),
      keyboardType: keyboardType,
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
        labelText: labelText,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: 16,
          color: Color(0xff7c7878),
        ),
        hintText: "Enter Text",
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          color: Color(0xff000000),
        ),
        filled: true,
        fillColor: const Color(0x00ffffff),
        isDense: false,
        contentPadding: const EdgeInsets.all(0),
      ),
    );
  }

  Padding passwordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: TextField(
        readOnly: true,
        controller: TextEditingController(text: '123456'),
        obscureText: true,
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
          hintText: "Enter Text",
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 14,
            color: Color(0xff000000),
          ),
          filled: true,
          fillColor: const Color(0x00ffffff),
          isDense: false,
          contentPadding: const EdgeInsets.all(0),
          suffixIcon: const Icon(Icons.visibility_outlined,
              color: Color(0xff7b7c82), size: 24),
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
          color: Color(0xff3a57e8),
        ),
        textAlign: TextAlign.start,
        overflow: TextOverflow.clip,
      ),
    );
  }

  MaterialButton createAccountButton(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
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

  Padding logOutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 25, 0, 10),
      child: MaterialButton(
        onPressed: () async {
          await signOut();
          if (FirebaseAuth.instance.currentUser == null) {
            if (context.mounted) {
              Navigator.of(context).pop();
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
          "Logout",
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
