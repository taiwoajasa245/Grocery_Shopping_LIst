import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {
  const BuildTextField({
    Key? key,
    required this.itemNameController,
    required this.label,
    required this.hint,
    required this.width,
  }) : super(key: key);

  final TextEditingController itemNameController;
  final String label;
  final String hint;
  final double width;

  @override
  Widget build(BuildContext context) {
    print("Building TextField for label: $label");
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 23.0,
                fontFamily: 'Inter',
                color: Colors.black,
              ),
            ),
          ),
          TextField(
            controller: itemNameController,
            autofocus: true,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              hintText: hint,
              contentPadding: const EdgeInsets.all(16.0), // Increase padding
            ),
            style: const TextStyle(fontSize: 20.0), // Increase input text size
            onChanged: (value) {
              print('Current value: $value');
            },
          ),
        ],
      ),
    );
  }
}
