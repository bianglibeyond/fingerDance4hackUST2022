import 'package:flutter/material.dart';
import '../model/glove.dart';
import 'package:myapp/main.dart';

class GlovesList extends StatelessWidget {
  final List<Gloves> gloves;

  GlovesList(this.gloves);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  )),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    gloves[index].name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        gloves[index].name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(gloves[index].type)
                    ]),
                Column(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: FlatButton(
                          onPressed: () => print("启动"),
                          child: Text("On"),
                          textColor: Colors.purple,
                        ))
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: RaisedButton(
                          onPressed: () => print("关闭"),
                          child: Text("Off"),
                          textColor: Colors.purple,
                        ))
                  ],
                )
              ],
            ),
          );
        },
        itemCount: gloves.length,
      ),
    );
  }
}
