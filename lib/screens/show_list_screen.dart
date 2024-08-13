import 'package:flutter/material.dart';
import 'package:grocery_list_flutter/utils/grocerylist_brain.dart';
import 'package:grocery_list_flutter/utils/list_data.dart';
import 'package:grocery_list_flutter/utils/list_item.dart';
import 'package:grocery_list_flutter/widgets/add_button.dart';
import 'package:grocery_list_flutter/widgets/item_card.dart';
import 'package:grocery_list_flutter/widgets/main_dialog.dart';
import 'package:grocery_list_flutter/widgets/side_popup.dart';
import 'package:grocery_list_flutter/widgets/build_tag.dart';

class ShowListScreen extends StatefulWidget {
  const ShowListScreen(
      {super.key, required this.itemList, required this.lable});

  final List<GroceryItem> itemList;
  final String lable;

  @override
  _ShowListScreenState createState() => _ShowListScreenState();
}

class _ShowListScreenState extends State<ShowListScreen> {
  int _checkedCount = 0;

  void _onCheckedChange(bool isChecked) {
    setState(() {
      if (isChecked) {
        _checkedCount++;
      } else {
        _checkedCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_sharp,
            ),
            onPressed: () {
              final returnData = ListData(
                itemList: widget.itemList,
                checkedCount: _checkedCount,
                itemListLength: widget.itemList.length,
              );

              Navigator.pop(context, widget.itemList);
            },
          ),
        ),
        actions: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.transparent,
            child: IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierLabel: 'Dismiss',
                  barrierColor: Colors.black54,
                  transitionDuration: const Duration(milliseconds: 300),
                  pageBuilder: (context, _, __) => const CustomDialogContent(),
                  transitionBuilder: (context, animation1, animation2, child) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1.0, 0.0),
                        end: const Offset(0.0, 0.0),
                      ).animate(animation1),
                      child: child,
                    );
                  },
                );
              },
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 15.0,
          top: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 15.0),
              child: Text(
                widget.lable,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter',
                  fontSize: 25.0,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            ListTag(
                label1:
                    'List $_checkedCount/${widget.itemList.length}  Completed',
                label2: 'Kitchen Items'),
            Expanded(
              child: widget.itemList.isEmpty
                  ? const Center(
                      child: Text(
                        'No item Added',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  : ListView.builder(
                      itemCount: widget.itemList.length,
                      itemBuilder: (context, index) {
                        final item = widget.itemList[index];
                        return ItemCard(
                          name: item.name,
                          onCheckedChange: _onCheckedChange,
                        );
                      },
                    ),
            ),
            AddButton(
              height: 80.0,
              operation: () async {
                final newItem = await showDialog<GroceryItem>(
                  context: context,
                  builder: (BuildContext context) {
                    return MainListDialog(
                      label: 'Edit Item',
                      groceryListItem: widget.itemList,
                    );
                  },
                );

                if (newItem != null) {
                  setState(() {
                    widget.itemList.add(newItem);
                  });
                }
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: Icon(
                      Icons.add_box_outlined,
                      size: 22.0,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  Text(
                    'Add new Item',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
