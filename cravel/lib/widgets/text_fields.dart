import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.labelText,
    required this.hintText,
    required Icon prefixIcon,
  });

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String labelText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
      child: TextField(
        controller: controller,
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
          hintText: hintText,
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
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required this.password,
    required this.passwordVisible,
    required this.suffixIcon,
  });

  final TextEditingController password;
  final bool passwordVisible;
  final Widget suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
        child: TextField(
          controller: password,
          obscureText: passwordVisible,
          keyboardType: TextInputType.visiblePassword,
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
            suffixIcon: suffixIcon,
            alignLabelWithHint: false,
          ),
        ),
      ),
    );
  }
}
