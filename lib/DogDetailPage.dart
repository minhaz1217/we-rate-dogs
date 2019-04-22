import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

import 'Dog.dart';
import 'CONSTANTS.dart';
class DogDetailPage extends StatefulWidget{
  final Dog dog;

  DogDetailPage(this.dog);

  @override
  State<StatefulWidget> createState() => _DogDetailPageState();
}

class _DogDetailPageState extends State<DogDetailPage>{

  final double dogAvatarSize = 150.0;
  double _sliderValue = 10.0;
  Widget get dogImage{
    return Container(
      height: dogAvatarSize,
      width: dogAvatarSize,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            const BoxShadow(
                offset: const Offset(1.0, 2.0),
                blurRadius: 2.0,
                spreadRadius: -1.0,
                color: const Color(0x33000000)
            ),
            const BoxShadow(
                offset: const Offset(2.0, 1.0),
                blurRadius: 3.0,
                spreadRadius: 0.0,
                color: const Color(0x24000000)
            ),
            const BoxShadow(
                offset: const Offset(3.0, 1.0),
                blurRadius: 4.0,
                spreadRadius: 2.0,
                color: const Color(0x1F000000)
            ),
          ],
        image: DecorationImage(
          fit: BoxFit.cover,
          image : NetworkImage(widget.dog.imageUrl),
        )
      ),
    );
  }
  Widget get rating{
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.star,
          size: 40.0,
          color: Colors.amber,
        ),
        Text(
          '${widget.dog.rating}/10',
          style: TextStyle(
            fontSize: 32.0,
            color: PROFILE_TEXT_COLOR,
          ),

        ),
      ],
    );
  }
  Widget get addYourRating{
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Slider(
                  activeColor: SLIDERACTIVECOLOR,
                  min: 0.0,
                  max: 15.0,
                  onChanged: (newRating){
                    setState(()=> _sliderValue = newRating);
                  },
                  value: _sliderValue,
                ),
              ),
              Container(
                width: 50.0,
                alignment: Alignment.center,
                child: Text(
                  '${_sliderValue.toInt()}',
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
            ],
          ),
        ),
        submitRatingButton,
      ],
    );
  }
  Widget get submitRatingButton{
    return RaisedButton(
      onPressed: ()=> updateRating(),
      child: Text("Submit"),
      color: RATINGBUTTONCOLOR,
    );
  }
  Widget get dogProfile{
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 32.0,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.indigo[800],
            Colors.indigo[700],
            Colors.indigo[600],
            Colors.indigo[400],
          ],
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          dogImage,
          Text(
            '${widget.dog.name} ',
            style: TextStyle(
              fontSize: 32.0,
              color: PROFILE_TEXT_COLOR,
            ),
          ),
          Text(
            widget.dog.location,
            style: TextStyle(
                fontSize: 20.0,
                color: PROFILE_TEXT_COLOR,
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Text(
                widget.dog.description,
                style: TextStyle(
                  color: PROFILE_TEXT_COLOR,
                ),
            ),
          ),
          rating
        ],
      ),
    );
  }

  void updateRating(){

    setState( (){
      if(_sliderValue < 10){
        _ratingErrorDialog();
      }else{
        widget.dog.rating = _sliderValue.toInt();
      }
//      print("New Rating: " + widget.dog.rating .toString());

    });
  }
  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0;
    return Hero(
        tag: widget.dog,
        child: Scaffold(
          backgroundColor: APPBAR,
            appBar: AppBar(
              backgroundColor: APPBAR,
                title: Text('Meet ${widget.dog.name}'),
            ),
          body: ListView(
            children: <Widget>[
              dogProfile,
              addYourRating,
            ],
          ),
        )
    );
  }
  Future<Null> _ratingErrorDialog() async{
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Error!!"),
          content: Text('They are all good dogs, Carol'),
          actions: <Widget>[
            FlatButton(
              child: Text('Try again'),
              onPressed: ()=>Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}

