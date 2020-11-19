import 'package:flutter/material.dart';

class Item {
  String name;
  bool isDone;
  Item({this.name, this.isDone = false});
}

class MyState extends ChangeNotifier {
  List<Item> _list = [];
  List<Item> get list => _list;

  void addItem(Item item) {
    _list.add(item);
    notifyListeners();
  }

  void removeTodo(Item item) {
    _list.remove(item);
    notifyListeners();
  }

  List<Item> filteredList(String filter) {
    if (filter == "Done") {
      return _list.where((item) => item.isDone == true).toList();
    } else if (filter == "Not Done") {
      return _list.where((item) => item.isDone == false).toList();
    }

    return _list;
  }
}
