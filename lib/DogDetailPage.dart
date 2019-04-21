import 'package:flutter/material.dart';
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: APPBAR,
        appBar: AppBar(
          backgroundColor: APPBAR,
            title: Text('Meet ${widget.dog.name}'),
        ),
      body: dogProfile,
    );
  }

}