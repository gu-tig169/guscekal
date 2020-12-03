import 'dart:convert';
import 'package:asignment/model.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static final String apiUrl =
      'https://todoapp-api-vldfm.ondigitalocean.app/todos';
  static final String apiKey = '45f4a2d1-d6fd-4576-9d60-3cbb80c8a1e8';

// GET
  static Future<List<Item>> getItems() async {
    http.Response res = await http.get(apiUrl + '?key=' + apiKey);
    //print(_mapResponseToList(res));
    return _mapResponseToList(res);
  }

// POST
  static Future<List<Item>> postItem(Item item) async {
    http.Response res = await http.post(
      apiUrl + '?key=' + apiKey,
      headers: <String, String>{'Content-type': 'application/json'},
      body: jsonEncode(<String, dynamic>{
        "title": item.name,
        "done": item.isDone,
      }),
    );
    print(_mapResponseToList(res));
    return _mapResponseToList(res);
  }

// PUT
  static Future<List<Item>> putItem(Item item) async {
    http.Response res = await http.put(
      apiUrl + '/${item.id}?key=' + apiKey,
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(<String, dynamic>{
        "title": item.name,
        "done": item.isDone,
      }),
    );
    return _mapResponseToList(res);
  }

  // DELETE
  static Future<List<Item>> deleteItem(Item item) async {
    http.Response res = await http.delete(apiUrl + '/${item.id}?key=' + apiKey);
    print(res.body);
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
