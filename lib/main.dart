import "package:flutter/material.dart";
import 'package:t_we_rate_dogs/AddDog.dart';
import "Dog.dart";
import 'DogList.dart';
import 'CONSTANTS.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "We rate dogs",
      theme: ThemeData(brightness: Brightness.light),
      home: MyHomePage(title : "We Rate Dogs"),
    );
  }
}

class MyHomePage extends StatefulWidget{
  final String title;

  MyHomePage({Key key, this.title}): super(key: key);


  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  List<Dog> dogs = []
    ..add(Dog('Ruby', 'Portland, OR, USA',
        'Ruby is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.'))
    ..add(Dog('Rex', 'Seattle, WA, USA', 'Best in Show 1999'))
    ..add(Dog('Rod Stewart', 'Prague, CZ',
        'Star good boy on international snooze team.'))
    ..add(Dog('Herbert', 'Dallas, TX, USA', 'A Very Good Boy'))
    ..add(Dog('Buddy', 'North Pole, Earth', 'Self proclaimed human lover.'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: APPBAR,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _showNewDogForm,
          ),
        ],
      ),
      body: Container(
        child: DogList(dogs),
//        child:/**/ AddDog(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops : [0.1,0.5,0.7,0.9],
            colors:[
              Colors.blue[700],
              Colors.blue[400],
              Colors.blue[700],
              Colors.blue[400],
            ],
          ),
        ),
      ),
    );
  }
  Future _showNewDogForm() async{
    Dog newDog = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context){
          return AddDog();
        }
      ),
    );
    if(newDog != null){
      dogs.add(newDog);
    }
  }
}