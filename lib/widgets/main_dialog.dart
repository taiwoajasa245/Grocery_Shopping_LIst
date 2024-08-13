import 'package:flutter/material.dart';
import 'package:grocery_list_flutter/screens/show_list_screen.dart';
import 'package:grocery_list_flutter/utils/list_item.dart';
import 'package:grocery_list_flutter/widgets/add_button.dart';
import 'package:grocery_list_flutter/widgets/build_textfield.dart';
import 'package:grocery_list_flutter/screens/all_list_screen.dart';

import 'package:grocery_list_flutter/utils/grocerylist_brain.dart';

class MainListDialog extends StatefulWidget {
  final String label;
  final List<GroceryItem> groceryListItem;

  const MainListDialog({
    super.key,
    required this.label,
    required this.groceryListItem,
  });

  @override
  State<MainListDialog> createState() => _MainListDialogState();
}

class _MainListDialogState extends State<MainListDialog> {
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _quantityNameController = TextEditingController();
  final TextEditingController _unitNameController = TextEditingController();
  final TextEditingController _priceNameController = TextEditingController();
  final TextEditingController _descriptionNameController =
      TextEditingController();

  void addItem() {
    GroceryItem groceryItem = GroceryItem(
      name: _itemNameController.text,
      quantity: int.parse(_quantityNameController.text),
      unit: _unitNameController.text,
      price: double.parse(_priceNameController.text),
      description: _descriptionNameController.text,
    );

    Navigator.pop(context, groceryItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 40),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.label,
                  style: const TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.cancel_rounded),
                ),
              ],
            ),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 16.0),
                    BuildTextField(
                      itemNameController: _itemNameController,
                      label: 'Item name',
                      hint: '-',
                      width: double.infinity,
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BuildTextField(
                          itemNameController: _quantityNameController,
                          label: 'Quantity',
                          hint: '₦-',
                          width: 130.0,
                        ),
                        BuildTextField(
                          itemNameController: _unitNameController,
                          label: 'Unit',
                          hint: '₦-',
                          width: 130.0,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    BuildTextField(
                      itemNameController: _priceNameController,
                      label: 'Price',
                      hint: '₦-',
                      width: double.infinity,
                    ),
                    const SizedBox(height: 16.0),
                    BuildTextField(
                      itemNameController: _descriptionNameController,
                      label: 'Description',
                      hint: 'Enter a Description.... ',
                      width: 300.0,
                    ),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
            ),
            AddButton(
              height: 50.0,
              operation: () {
                addItem();
              },
              child: const Text(
                'Save',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
