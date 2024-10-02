import 'package:flutter/material.dart';

class LogoPicture extends StatelessWidget {
  const LogoPicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: Align(
        alignment: Alignment.center,
        child: Image(
          image: AssetImage("assets/images/onlyLogo.png"),
          height: 150,
          width: 150,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class InformativeText extends StatelessWidget {
  final String informative;

  const InformativeText({
    super.key,
    required this.informative,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: Text(
        informative,
        textAlign: TextAlign.start,
        overflow: TextOverflow.clip,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: 18,
          color: Color(0xffa29b9b),
        ),
      ),
    );
  }
}

class Salutations extends StatelessWidget {
  final String salute;

  const Salutations({
    super.key,
    required this.salute,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      salute,
      textAlign: TextAlign.start,
      overflow: TextOverflow.clip,
      style: const TextStyle(
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontSize: 22,
        color: Color(0xff000000),
      ),
    );
  }
}
