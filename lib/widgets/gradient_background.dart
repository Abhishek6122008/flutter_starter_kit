import 'package:flutter/material.dart';

class GradientBackground
    extends
        StatelessWidget {
  const GradientBackground({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(
              0xFF0F2027,
            ), // deep space blue
            Color(
              0xFF203A43,
            ), // galaxy teal
            Color(
              0xFF2C5364,
            ), // horizon blue
          ],
        ),
      ),
      child: child,
    );
  }
}
