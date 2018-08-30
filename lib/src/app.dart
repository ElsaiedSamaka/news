import "package:flutter/material.dart";

class App extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
      title: 'News',
      home: Scaffold(
        body: Center(
          child: Stack(
            children: <Widget>[
              Text('sdfsdfsdf'),
              RaisedButton(child: Text('sdfsdf'), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
