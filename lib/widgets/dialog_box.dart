import 'package:flutter/material.dart';
import 'package:grocery_list_flutter/widgets/add_button.dart';
import 'package:grocery_list_flutter/widgets/build_textfield.dart';
import 'package:grocery_list_flutter/screens/all_list_screen.dart';

import 'package:grocery_list_flutter/utils/grocerylist_brain.dart';

class AddItemDialog extends StatefulWidget {
  const AddItemDialog({super.key, required this.groceryListItem});

  final List<GroceryItem> groceryListItem;

  @override
  State<AddItemDialog> createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _quantityNameController = TextEditingController();
  final TextEditingController _unitNameController = TextEditingController();
  final TextEditingController _priceNameController = TextEditingController();
  final TextEditingController _descriptionNameController =
      TextEditingController();

  void addItem(
      {required String name,
      required int quantity,
      required String unit,
      required double price,
      required String description}) {
    GroceryItem groceryItem = GroceryItem(
      name: name,
      quantity: quantity,
      unit: unit,
      price: price,
      description: description,
    );

    widget.groceryListItem.add(groceryItem);
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
                const Text(
                  'Add Item',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    print("Cancel button pressed");
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
                // Perform the action with the input data
                print('Item Name: ${_itemNameController.text}');
                print('Item quantity: ${_quantityNameController.text}');
                print('Item price: ${_priceNameController.text}');
                print('Item unit: ${_unitNameController.text}');
                print('Item description: ${_descriptionNameController.text}');

                // add item to list

                addItem(
                  name: _itemNameController.text.toString(),
                  quantity: int.parse(_quantityNameController.text),
                  unit: _unitNameController.text,
                  price: double.parse(_priceNameController.text),
                  description: _descriptionNameController.text,
                );

                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AllLIstItemsCard(groceryList: widget.groceryListItem),
                  ),
                );
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
