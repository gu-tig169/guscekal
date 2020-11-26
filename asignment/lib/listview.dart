import 'package:flutter/material.dart';
import 'model.dart';
import 'package:provider/provider.dart';

class ItemList extends StatefulWidget {
  final List<Item> list;
  ItemList(this.list);

  @override
  _ItemListState createState() => _ItemListState();
}

// Kollar igenom listan och bygger den
class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (context, index) => _item(widget.list[index]));
  }

  Widget _item(Item item) {
    return ListTile(
      leading: Checkbox(
        value: item.isDone,
        onChanged: (bool value) {
          setState(() {
            // checkboxens värde uppdateras (när användaren klickar i eller ut checkboxen)
            item.isDone = value;
            Provider.of<MyState>(context, listen: false).putItem(item);
          });
        },
      ),
      title: Text(item.name,
          style: TextStyle(
            decoration: item.isDone == true ? TextDecoration.lineThrough : null,
            color: Colors.black,
          )),
      trailing: IconButton(
        color: Colors.black,
        icon: Icon(Icons.close),
        onPressed: () {
          Provider.of<MyState>(context, listen: false).removeItem(
              item); // removeItem tar bort när användaren klickar på krysset
        },
      ),
    );
  }
}
