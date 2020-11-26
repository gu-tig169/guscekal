import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'listview.dart';
import 'secondView.dart';
import 'package:asignment/model.dart';

void main() {
  var state = MyState();
  runApp((ChangeNotifierProvider(
    create: (context) => state,
    child: ListApp(),
  )));
}

class ListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<String> _filterList = ["All", "Done", "Not Done"];
  String _filterValue = "All";

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TIG169 TO DO'),
        centerTitle: true,
        backgroundColor: Colors.grey,
        actions: <Widget>[
          PopupMenuButton<String>(onSelected: (String value) {
            setState(() {
              _filterValue = value;
              print(_filterValue);
            });
          }, itemBuilder: (BuildContext context) {
            return _filterList
                .map((filter) =>
                    PopupMenuItem(value: filter, child: Text(filter)))
                .toList();
          })
        ],
      ),
      body: Consumer<MyState>(
          builder: (context, state, child) =>
              ItemList(state.filteredList(_filterValue))),

      // skapa add-knapp, skickas till nästa sida
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondView()));
        },
      ),
    );
  }
}
