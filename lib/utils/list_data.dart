import 'package:grocery_list_flutter/utils/grocerylist_brain.dart';

class ListData {
  final List<GroceryItem> itemList;
  final int checkedCount;
  final int itemListLength;

  ListData(
      {required this.itemList,
      required this.checkedCount,
      required this.itemListLength});
}
