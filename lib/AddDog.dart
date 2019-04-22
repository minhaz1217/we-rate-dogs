import 'package:flutter/material.dart';
import 'package:t_we_rate_dogs/Dog.dart';
import 'CONSTANTS.dart';

class AddDog extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AddDogState();
}


class _AddDogState extends State<AddDog>{
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();



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
                  onChanged: (v)=> nameController.text = v,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                    decoration: InputDecoration(
                      labelText: "Pup's location",
                    ),
                    onChanged: (v)=> locationController.text = v
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'All about the pup',
                  ),
                  onChanged: (v)=> descriptionController.text = v
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Builder(
                  builder: (context){
                    return RaisedButton(
                      onPressed: ()=>submitPup(context),
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
  void submitPup(BuildContext context){
    if(nameController.text.isEmpty){
      Scaffold.of(context).showSnackBar(
        SnackBar(
          backgroundColor: INFO_TOAST_COLOR,
          content: Text("Pups need names!!"),
        ),
      );
    }else{
      var newDog = Dog(nameController.text, locationController.text, descriptionController.text);
      Navigator.of(context).pop(newDog);
    }
  }

}