import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  //final String text;
  final ValueChanged<String> onChanged;
  const FilterWidget(/*this.text,*/ this.onChanged);
  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  final filterController = TextEditingController();
  clearTextInput() {
    filterController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          Expanded(
            child: TextField(
              controller: filterController,
              decoration: InputDecoration.collapsed(hintText: 'Search a coin'),
              onChanged: (text) {
                widget.onChanged(text);
              },
            ),
          ),
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                clearTextInput();
                widget.onChanged('');
              }),
        ],
      ),
    );
  }
}
