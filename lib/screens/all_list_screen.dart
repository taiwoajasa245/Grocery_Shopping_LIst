import 'package:flutter/material.dart';
import 'package:grocery_list_flutter/widgets/dialog_box.dart';
import 'package:grocery_list_flutter/widgets/header_container.dart';
import 'package:grocery_list_flutter/widgets/list_card.dart';
import 'package:grocery_list_flutter/utils/grocerylist_brain.dart';
import 'package:grocery_list_flutter/widgets/round_icon_button.dart';

class AllLIstItemsCard extends StatelessWidget {
  final List<GroceryItem> groceryList;
  // final String itemName;

  AllLIstItemsCard({
    super.key,
    required this.groceryList,
  });

  List<GroceryItem> itemList = [];
  // int checkedCount;
  // int itemsLength;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: RoundIconButton(
        icon: Icons.add,
        operation: () async {
          final result = await showDialog<GroceryItem>(
            context: context,
            builder: (BuildContext context) {
              return AddItemDialog(groceryListItem: groceryList);
            },
          );

          if (result != null) {
            itemList = result as List<GroceryItem>;
          }
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 15.0,
            top: 10.0,
          ),
          child: Column(
            children: [
              const HerderCard(),
              Expanded(
                flex: 6,
                child: ListView.builder(
                  itemCount: groceryList.length,
                  itemBuilder: (context, index) {
                    final item = groceryList[index];
                    return ListCard(
                      label: item.name,
                      name: item.name,
                      list: itemList,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
