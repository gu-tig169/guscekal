import 'dart:convert';
import 'package:asignment/model.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static final String postUrl =
      'https://todoapp-api-vldfm.ondigitalocean.app/todos' +
          '?key=' +
          '4ce26b5f-9b7b-4297-8e51-e9801417b29a';
  static final String getUrl =
      'https://todoapp-api-vldfm.ondigitalocean.app/todos?' +
          'key=' '4ce26b5f-9b7b-4297-8e51-e9801417b29a';

// GET
  static Future<List<Item>> getItems() async {
    http.Response res = await http.get(getUrl);

    //print(_mapResponseToList(res));
    return _mapResponseToList(res);
  }

// POST
  static Future<List<Item>> postItem(Item item) async {
    http.Response res = await http.post(
      postUrl,
      headers: <String, String>{"Content-type": "application/json"},
      body: jsonEncode(<String, dynamic>{
        "title": item.name,
        "done": item.isDone,
      }),
    );
    //print(_mapResponseToList(res));
    return _mapResponseToList(res);
  }

// PUT
  static Future<List<Item>> putItem(Item item) async {
    http.Response res = await http.put(
      'https://todoapp-api-vldfm.ondigitalocean.app/todos/' +
          '${item.id}?key=' +
          '4ce26b5f-9b7b-4297-8e51-e9801417b29a',
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(<String, dynamic>{
        "title": item.name,
        "done": item.isDone,
      }),
    );
    return _mapResponseToList(res);
  }

  // DELETE
  static Future<List<Item>> deleteItem(Item item) async {
    http.Response res = await http.delete(
        'https://todoapp-api-vldfm.ondigitalocean.app/todos/' +
            '${item.id}?key=' +
            '4ce26b5f-9b7b-4297-8e51-e9801417b29a');
    //print(res.body);
    return _mapResponseToList(res);
  }

  static List<Item> _mapResponseToList(http.Response res) {
    List<Item> todoList = [];
    var jsonResponseBody = res.body;

    var responseBody = jsonDecode(jsonResponseBody);

    responseBody
        .map((object) => todoList.add(Item(
              id: object["id"],
              name: object["title"],
              isDone: object["done"],
            )))
        .toList();

    return todoList;
  }
}
