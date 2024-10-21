import 'package:flutter/material.dart';

Widget densityPage() {
  return Center(
    child: TweenAnimationBuilder(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOutCubic,
      tween: Tween<double>(begin: 0.0, end: 175.0),
      builder: (context, double size, child) {
        return Container(
          width: double.infinity / 2,
          height: size * 1,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color.fromARGB(255, 51, 81, 231),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 51, 81, 231),
                blurRadius: size * 2,
              ),
            ],
          ),
          child: Center(
            child: Text(
              'Coming\nSoon !',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color.fromARGB(233, 255, 255, 255),
                fontSize: size * 0.11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      },
    ),
  );
}
