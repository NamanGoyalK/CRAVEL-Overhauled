import 'package:flutter/material.dart';

class LogoPicture extends StatefulWidget {
  const LogoPicture({super.key});

  @override
  State<LogoPicture> createState() => _LogoPictureState();
}

class _LogoPictureState extends State<LogoPicture>
    with SingleTickerProviderStateMixin {
  late Animation<double> logoAnimation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    logoAnimation = Tween<double>(begin: 0, end: 1).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: Align(
        alignment: Alignment.center,
        child: FadeTransition(
          opacity: logoAnimation,
          child: const Center(
            child: Image(
              image: AssetImage("assets/images/final_branding.png"),
              height: 120,
              width: 200,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class InformativeText extends StatelessWidget {
  final String informative;
  const InformativeText({super.key, required this.informative});

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
