import 'package:flutter/material.dart';
import 'package:grocery_list_flutter/screens/show_list_screen.dart';
import 'package:grocery_list_flutter/utils/grocerylist_brain.dart';
import 'package:grocery_list_flutter/utils/list_item.dart';
import 'package:grocery_list_flutter/widgets/build_tag.dart';

class ListCard extends StatefulWidget {
  const ListCard({
    super.key,
    required this.label,
    required this.name,
    required this.list,
  });

  final String label;
  final String name;
  final List<GroceryItem> list;

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: GestureDetector(
        onTap: () {
          List<GroceryItem> itemList = widget.list;

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShowListScreen(
                lable: widget.name,
                itemList: itemList,
              ),
            ),
          );
        },
        child: Card(
          color: const Color(0xFFFCFCFD),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isFavorited = !_isFavorited;
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: const Color(0xFFF9F5FF),
                          child: Icon(
                            _isFavorited
                                ? Icons.favorite_rounded
                                : Icons.favorite_outline_rounded,
                            color: const Color(0xFFB692F6),
                            size: 30.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  widget.label.toString(),
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter'),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 8),
                const ListTag(
                  label1: 'List 1/7 Completed',
                  label2: 'Kitchen items',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
