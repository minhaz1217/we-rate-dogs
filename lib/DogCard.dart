import "package:flutter/material.dart";
import 'DogDetailPage.dart';

import "Dog.dart";
import 'CONSTANTS.dart';
class DogCard extends StatefulWidget{
  final Dog dog;
  DogCard(this.dog);
  @override
  _DogCardState createState() => _DogCardState(dog);

}
class _DogCardState extends State<DogCard>{
  
  Dog dog;
  String renderUrl;
  _DogCardState(this.dog);
  Widget get dogImage{
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(renderUrl??""),
        ),
      ),
    );
  }
  void initState(){
    super.initState();
    renderDogPic();
  }
  void renderDogPic() async{
    await dog.getImageUrl();
    setState((){
      renderUrl = dog.imageUrl;
    });
  }
  
  
  Widget get dogCard{
    return Container(
      width: 290.0,
      height: 115.0,
      child : Card(
        color: CARD_COLOR,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            left: 64.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(widget.dog.name,
                style: Theme.of(context).textTheme.headline,
              ),
              Text(
                widget.dog.location,
                style: Theme.of(context).textTheme.subhead,
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.star),
                  Text(": ${widget.dog.rating}/10")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: showDogDetailPage,
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          height: 115.0,
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 50.0,
                child: dogCard,
              ),
              Positioned(
                top: 7.5,
                child: dogImage,
              )
            ],
          ),
        ),
      ),
    );
  }
  showDogDetailPage(){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context){
          return DogDetailPage(dog);
        }
      )
    );
  }
}

