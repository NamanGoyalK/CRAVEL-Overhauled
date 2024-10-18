import 'package:flutter/material.dart';
import 'package:cravel/widgets/text_fields.dart';
import 'dart:async';

final TextEditingController email = TextEditingController();
final TextEditingController location = TextEditingController();
final TextEditingController description = TextEditingController();
String defaultTime = DateTime.now().toString();
TextEditingController time =
    TextEditingController(text: defaultTime.substring(0, 16));

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  ReportPageState createState() => ReportPageState();
}

class ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          Center(
            child: Column(
              children: [
                reportTitle(),
                inputForReport(),
                const SubmitButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SubmitButton extends StatefulWidget {
  const SubmitButton({
    super.key,
  });

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  bool _enabled = true;
  bool isExpanded = false;
  bool isSubmitted = false;
  void _onTap() {
    // Disable GestureDetector's 'onTap' property.
    setState(() => _enabled = false);

    // Enable it after 1s.
    Timer(const Duration(seconds: 4), () => setState(() => _enabled = true));

    setState(() {
      isExpanded = !isExpanded;
      if (isSubmitted) {
        Timer(const Duration(seconds: 3), () {
          setState(() {
            isExpanded = false;
            email.clear();
            location.clear();
            description.clear();
            time.text = defaultTime.substring(0, 16);
            FocusScope.of(context).unfocus();
            isSubmitted = false;
          });
        });
      } else {
        Timer(const Duration(seconds: 3), () {
          setState(() {
            isExpanded = false;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: _enabled ? _onTap : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOutCubic,
          padding: const EdgeInsets.all(6.0),
          margin: const EdgeInsets.all(6.0),
          width: isExpanded ? 220 : 100,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(isExpanded ? 30.0 : 6.0),
            color: const Color.fromARGB(255, 255, 255, 255),
            border: Border.all(
              color: isExpanded
                  ? (isSubmitted
                      ? const Color.fromARGB(255, 3, 136, 69)
                      : const Color.fromARGB(255, 155, 3, 3))
                  : const Color.fromARGB(255, 51, 81, 231),
            ),
          ),
          child: Text(
            isExpanded
                ? (isSubmitted ? 'Report Submitted !' : 'Report canceled !')
                : 'SUBMIT',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              fontSize: 20,
              color: isExpanded
                  ? (isSubmitted
                      ? const Color.fromARGB(255, 3, 136, 69)
                      : const Color.fromARGB(255, 155, 3, 3))
                  : const Color.fromARGB(255, 51, 81, 231),
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}

Padding inputForReport() {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
      children: [
        InputField(
            controller: email,
            keyboardType: TextInputType.emailAddress,
            labelText: 'Email',
            hintText: 'Enter an Email'),
        const SizedBox(height: 30),
        InputField(
            controller: location,
            keyboardType: TextInputType.streetAddress,
            labelText: 'Location',
            hintText: 'Enter the Location'),
        const SizedBox(height: 30),
        InputField(
            controller: description,
            keyboardType: TextInputType.text,
            labelText: 'Description',
            hintText: 'Enter a brief description'),
        const SizedBox(height: 30),
        InputField(
            controller: time,
            keyboardType: TextInputType.emailAddress,
            labelText: 'Time',
            hintText: 'Enter the time'),
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
