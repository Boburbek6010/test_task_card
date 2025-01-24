import 'package:flutter/material.dart';

class CustomScanButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Widget icon;

  const CustomScanButton({super.key, required this.onTap, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.white.withValues(alpha: 0.2),
      elevation: 10,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(8),
      ),
      onPressed: onTap,
      child: Row(
        spacing: 10,
        children: [
          icon,
          Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
