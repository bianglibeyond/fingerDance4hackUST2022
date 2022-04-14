import 'package:flutter/material.dart';

class NewGlove extends StatefulWidget {
  final Function addTx;

  NewGlove(this.addTx);

  @override
  State<NewGlove> createState() => _NewGloveState();
}

class _NewGloveState extends State<NewGlove> {
  final typeController = TextEditingController();

  final nameController = TextEditingController();

  void submitData() {
    final enteredType = typeController.text;
    final enteredName = nameController.text;

    if (enteredName.isEmpty || enteredType.isEmpty) {
      return;
    }

    widget.addTx(
      enteredType,
      enteredName,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: "Name"),
                controller: nameController,
                onSubmitted: (_) => submitData,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Type"),
                // onChanged: (val){
                //   //
                // },
                controller: typeController,
                onSubmitted: (_) => submitData,
              ),
              FlatButton(
                onPressed: submitData,
                child: Text("add glove"),
                textColor: Colors.purple,
              )
            ]),
      ),
    );
  }
}
