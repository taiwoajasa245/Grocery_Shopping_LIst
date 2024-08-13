import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton(
      {super.key, required this.icon, required this.operation});

  final IconData icon;
  final VoidCallback? operation;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: operation,
      elevation: 4.0,
      constraints: const BoxConstraints.tightFor(
        width: 66.0,
        height: 66.0,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFFF9F5FF),
      child: Icon(
        icon,
        size: 32.0,
        color: const Color(0xFF7F56D9),
      ),
    );
  }
}
