import 'package:flutter/material.dart';
import 'package:asignment/http_service.dart';
import 'package:flutter/cupertino.dart';

class Item {
  String id;
  String name;
  bool isDone;

  Item({this.id, this.name, this.isDone = false});
}

class MyState extends ChangeNotifier {
  List<Item> _list = [];

  MyState() {
    _postList();
  }

  void _postList() async {
    this._list = await HttpService.getItems();
    notifyListeners();
  }

  List<Item> get list => _list;

// mha listeners läggs en todo i listan till
  void addItem(Item item) async {
    _list = await HttpService.postItem(item);
    notifyListeners();
  }

// uppdaterar mina items (todo) med id
  void putItem(Item item) async {
    _list = await HttpService.putItem(item);
    notifyListeners();
  }

//som ovan, men tar bort en todo från listan
  void removeItem(Item item) async {
    _list = await HttpService.deleteItem(item);
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
