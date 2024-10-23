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
    return _buildTextField(controller, keyboardType, labelText, hintText);
  }

  Padding _buildTextField(TextEditingController controller,
      TextInputType keyboardType, String labelText, String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: false,
        textAlign: TextAlign.start,
        maxLines: 1,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14,
          color: Color(0xff000000),
        ),
        decoration: _inputDecoration(labelText, hintText),
      ),
    );
  }

  InputDecoration _inputDecoration(String labelText, String hintText) {
    return InputDecoration(
      disabledBorder: _border(),
      focusedBorder: _border(),
      enabledBorder: _border(),
      labelText: labelText,
      labelStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Color(0xff7c7878),
      ),
      hintText: hintText,
      hintStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xff000000),
      ),
      filled: true,
      fillColor: const Color(0x00ffffff),
      isDense: false,
      contentPadding: const EdgeInsets.all(0),
    );
  }

  UnderlineInputBorder _border() {
    return UnderlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: const BorderSide(color: Color(0xff000000), width: 1),
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required this.password,
    required this.passwordVisible,
    this.suffixIcon,
  });

  final TextEditingController password;
  final bool passwordVisible;
  final Widget? suffixIcon; // Made suffixIcon optional

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
      child: TextField(
        controller: password,
        obscureText: !passwordVisible, // Inverted for clarity
        keyboardType: TextInputType.visiblePassword,
        textAlign: TextAlign.start,
        maxLines: 1,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14,
          color: Color(0xff000000),
        ),
        decoration: InputDecoration(
          disabledBorder: _border(),
          focusedBorder: _border(),
          enabledBorder: _border(),
          labelText: "Password",
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Color(0xff7c7878),
          ),
          hintText: "Enter Password", // Updated hint text
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Color(0xff000000),
          ),
          filled: true,
          fillColor: const Color(0x00ffffff),
          isDense: false,
          contentPadding: const EdgeInsets.all(0),
          suffixIcon: suffixIcon, // Optional suffix icon
          alignLabelWithHint: false,
        ),
      ),
    );
  }

  UnderlineInputBorder _border() {
    return UnderlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: const BorderSide(color: Color(0xff000000), width: 1),
    );
  }
}
