import "package:flutter/material.dart";
import "dart:async";

class NewsList extends StatelessWidget {
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News List'),
      ),
      body: listBuilder(),
    );
  }

  Widget listBuilder(){
    return ListView.builder(
      itemCount: 1000,
      itemBuilder: (context, int indx){
        return FutureBuilder(
          future: getFuture(),
          builder: (context, snapshot){
            return Container(
              height: 80.0,
              child: snapshot.hasData
            ? Text('I am HERE $indx!')
            : Text('I am not here $indx!'),);
          },
        );
      },
    );
  }

  getFuture(){
    return Future.delayed(
      Duration(seconds: 2),
      () => 'hi!',
    );
  }
}
