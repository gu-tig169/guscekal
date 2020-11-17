import 'package:flutter/material.dart';

void main() => runApp(ListApp());

class ListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TIG169 TO DO'),
        centerTitle: true,
        backgroundColor: Colors.grey,
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: _list(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPage()));
        },
        backgroundColor: Colors.grey,
      ),
    );
  }

  Widget _list() {
    var toDoList = [
      'Write a book',
      'Do Homework',
      'Tidy room',
      'Watch TV',
      'Nap',
      'Shop groceries',
      'Have fun',
      'Meditate'
    ];
    return ListView(
      children: toDoList.map((item) => _item(item)).toList(),
    );
  }

  Widget _item(text) {
    return ListTile(
      leading: Checkbox(
        value: false,
        onChanged: null,
      ),
      title: Text(text),
      trailing: IconButton(
        icon: Icon(Icons.close),
        onPressed: () {},
      ),
    );
  }
}

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TIG169 TO DO'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(30),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'What are you going to do?',
              ),
            ),
          ),
          OutlineButton(
            onPressed: () {},
            child: Text('+' + ' ' + 'Add'),
          )
        ],
      ),
    );
  }
}
