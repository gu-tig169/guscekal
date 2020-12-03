import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class SecondView extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TIG169 TO DO'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _nameLabel(),
            _nameInputField(),
            Container(
              height: 24,
            ),
            Container(
              height: 24,
            ),
            _buttonRow(context),
          ],
        ),
      ),
    );
  }

  Widget _nameLabel() {
    return Container(
      margin: EdgeInsets.only(
        left: 16,
        top: 24,
      ),
      child: Text(''),
    );
  }

//fältet där Todo skrivs in
  Widget _nameInputField() {
    return Container(
      margin: EdgeInsets.all(30),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'What are you going to do?',
        ),
        controller: textEditingController,
      ),
    );
  }

// använder addItem från model.dart när användare klickar på add-knappen
  Widget _buttonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
          onPressed: () {
            Provider.of<MyState>(context, listen: false)
                .addItem(Item(name: textEditingController.text));
// när add-knappen klickas, skickas man tiilbaka till förstasidan
            Navigator.pop(context, "/");
          },
          child: Text('+' + ' ' + 'Add'),
          color: Colors.white,
          textColor: Colors.black,
          highlightColor: Colors.amber,
        ),
      ],
    );
  }
}
