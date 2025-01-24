import 'package:flutter/material.dart';

class ScaffoldWrapper extends StatelessWidget {
  final Widget child;

  const ScaffoldWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: Image.asset("assets/images/bcg.jpeg").image)),
      child: SafeArea(child: child),
    );
  }
}