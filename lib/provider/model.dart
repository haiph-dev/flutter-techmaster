import 'dart:math';

import 'package:flutter/material.dart';

class CatalogModel {
  List<ItemModel> list = [
    ItemModel('Product A'),
    ItemModel('Product B'),
    ItemModel('Product C'),
    ItemModel('Product D'),
    ItemModel('Product E'),
    ItemModel('Product F'),
    ItemModel('Product G'),
    ItemModel('Product H'),
    ItemModel('Product I'),
    ItemModel('Product K'),
    ItemModel('Product L'),
    ItemModel('Product M')
  ];

  ItemModel getByIndex(int index) {
    return list[index];
  }
}

class CartModel extends ChangeNotifier {
  List<ItemModel> list = [];

  ItemModel getByIndex(int index) {
    return list[index];
  }

  void add(ItemModel item) {
    list.add(item);
    notifyListeners();
  }

  void remove(ItemModel item) {
    list.remove(item);
    notifyListeners();
  }

  bool check(ItemModel item) {
    Iterable<ItemModel> findItem =
        list.where((element) => element.name == item.name);

    return findItem.isEmpty ? false : true;
  }
}

class ItemModel {
  final String name;
  Color color = Color.fromRGBO(
      Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1);

  ItemModel(this.name);
}
