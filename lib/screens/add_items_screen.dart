import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_list_flutter/utils/grocerylist_brain.dart';
import 'package:grocery_list_flutter/widgets/add_button.dart';
import 'package:grocery_list_flutter/widgets/dialog_box.dart';
import 'package:grocery_list_flutter/widgets/side_popup.dart';
import 'package:grocery_list_flutter/widgets/build_tag.dart';

class AddItems extends StatelessWidget {
  AddItems({super.key});

  List<GroceryItem> groceryList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFF9F5FF),
          child: IconButton(
            // color: const Color(0xFFF9F5FF),
            // padding: const EdgeInsets.all(10),
            splashColor: Colors.red,
            icon: const Icon(
              Icons.arrow_back_sharp,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        actions: <Widget>[
          CircleAvatar(
            backgroundColor: const Color(0xFFF9F5FF),
            child: IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierLabel: 'Dismiss',
                  barrierColor: Colors.black54,
                  transitionDuration: const Duration(milliseconds: 300),
                  pageBuilder: (context, _, __) => Container(
                    child: const CustomDialogContent(),
                  ),
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
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AddListTittle(),
            const ListTag(
              label1: 'List 0/0 Completed',
              label2: 'Add tag',
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 10.0),
                      child: SvgPicture.asset(
                        'assets/images/list_icon.svg',
                        width: 70.0,
                        height: 70.0,
                      ),
                    ),
                    const Text(
                      'Add items to your list',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: Text(
                        'Your smart shopping list will shown here. start by creating a new list',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    AddButton(
                      height: 80.0,
                      operation: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AddItemDialog(
                              groceryListItem: groceryList,
                            );
                          },
                        );
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
            )
          ],
        ),
      ),
    );
  }
}

class AddListTittle extends StatelessWidget {
  const AddListTittle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15.0),
      child: const Text(
        'Grocery Shopping List',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'Inter',
          fontSize: 25.0,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
