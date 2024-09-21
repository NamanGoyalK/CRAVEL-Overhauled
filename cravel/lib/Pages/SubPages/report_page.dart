import 'package:flutter/material.dart';

Widget reportPage(BuildContext context) {
  return Center(
    child: ListView(
      children: [
        Center(
          child: Column(
            children: [
              reportTitle(),
              inputText(
                'Email',
                'Enter Your Email',
                keyboardType: TextInputType.emailAddress,
                noLines: 1,
                justInCase: TextEditingController(),
              ),
              inputText(
                'Location',
                'Enter the Location',
                keyboardType: TextInputType.multiline,
                noLines: null,
                justInCase: TextEditingController(),
              ),
              inputText(
                'Description',
                'Please provide with a description',
                keyboardType: TextInputType.multiline,
                noLines: null,
                justInCase: TextEditingController(),
              ),
              inputText(
                'Time',
                'Enter Time',
                keyboardType: const TextInputType.numberWithOptions(),
                noLines: 1,
                justInCase:
                    TextEditingController(text: DateTime.now().toString()),
              ),
              submitButton(context),
            ],
          ),
        ),
      ],
    ),
  );
}

Padding reportTitle() {
  return const Padding(
    padding: EdgeInsets.all(12.0),
    child: Text(
      'REPORT',
      style: TextStyle(
        fontSize: 44,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 25, 0, 0),
        shadows: [
          Shadow(
            blurRadius: 5.0,
            color: Color.fromARGB(255, 115, 2, 2),
            offset: Offset(1.0, 1.0),
          ),
        ],
      ),
    ),
  );
}

Padding inputText(dynamic field, dynamic label,
    {required TextInputType keyboardType,
    required int? noLines,
    required justInCase}) {
  return Padding(
    padding: const EdgeInsets.all(24.0),
    child: TextField(
      controller: justInCase,
      keyboardType: keyboardType,
      obscureText: false,
      textAlign: TextAlign.start,
      maxLines: noLines,
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
        labelText: field,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: 16,
          color: Color(0xff7c7878),
        ),
        hintText: label,
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

Padding submitButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Report Submitted !'),
          content: const Text('Your report has been submitted successfully.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
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
        "SUBMIT",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          fontSize: 20,
          color: Color(0xff3a57e8),
        ),
        textAlign: TextAlign.start,
        overflow: TextOverflow.clip,
      ),
    ),
  );
}
