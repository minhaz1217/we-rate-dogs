import 'package:flutter/material.dart';

import 'Dog.dart';
import 'DogCard.dart';

class DogList extends StatelessWidget{

  final List<Dog> dogs;
  DogList(this.dogs);
  @override
  Widget build(BuildContext context) {
      return _buildList(context);
  }

  ListView _buildList(context){

    return ListView.builder(
        itemCount : dogs.length,
        itemBuilder: (context, int){
          return DogCard(dogs[int]);
        }
        );
  }
}

