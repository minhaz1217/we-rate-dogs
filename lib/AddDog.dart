import 'package:flutter/material.dart';
import 'CONSTANTS.dart';

class AddDog extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AddDogState();
}


class _AddDogState extends State<AddDog>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a new dog"),
        backgroundColor: APPBAR,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 32.0
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Name the pup",
                  ),
                )
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                    decoration: InputDecoration(
                      labelText: "Pup's location",
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'All about the pup',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Builder(
                  builder: (context){
                    return RaisedButton(
                      onPressed: ()=>print("Pressed"),
                      color: BUTTONCOLOR,
                      child: Text("Submit Pup"),
                    );
                  },
                ),
              ),
          ],
          ),
        ),
      ),
    );
  }

}