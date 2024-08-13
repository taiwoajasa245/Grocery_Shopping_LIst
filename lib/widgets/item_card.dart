import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  const ItemCard({
    super.key,
    required this.name,
    required this.onCheckedChange,
  });

  final String name;
  final ValueChanged<bool> onCheckedChange;

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Card(
        color: const Color(0xFFF9F5FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 2.0,
        child: ListTile(
          leading: GestureDetector(
            onTap: () {
              setState(() {
                _isChecked = !_isChecked;
                widget.onCheckedChange(_isChecked);
              });
            },
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(
                    color: _isChecked ? const Color(0xFF7F56D9) : Colors.black),
                color: Colors.transparent, // Transparent background
              ),
              child: _isChecked
                  ? const Icon(
                      Icons.check,
                      size: 15.0,
                      color: Color(0xFF7F56D9), // Check mark color
                    )
                  : null,
            ),
          ),
          title: Text(
            widget.name,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              decoration:
                  _isChecked ? TextDecoration.lineThrough : TextDecoration.none,
              color: _isChecked
                  ? const Color(0xFF7F56D9)
                  : const Color(0xFF344054),
            ),
          ),
        ),
      ),
    );
  }
}
