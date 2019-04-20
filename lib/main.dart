import "package:flutter/material.dart";
import "dog_model.dart";
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
      ),
      body: Container(
        child: Center(
          child: Text("Name: "+ dogs[0].name + "\nAddress: " + dogs[0].location + "\nDescription: " + dogs[0].description + "\nImage: " + dogs[0].imageUrl),
        ),
      ),
    );
  }

}