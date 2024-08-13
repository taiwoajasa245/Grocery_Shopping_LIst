import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.child,
    required this.height,
    required this.operation,
  });

  final Widget child;
  final double height;
  final VoidCallback operation;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: operation,
      elevation: 4.0,
      constraints: BoxConstraints.tightFor(
        width: double.infinity,
        height: height,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      fillColor: const Color(0xFF7F56D9),
      child: Center(
        child: child,
      ),
    );
  }
}
