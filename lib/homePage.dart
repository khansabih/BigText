import 'package:bobble_bigmauji/ColorPalette/myColors.dart';
import 'package:bobble_bigmauji/Widgets/DisplayChat.dart';
import 'package:bobble_bigmauji/Widgets/textWriting.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class homePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    // TODO: implement createState
    return new homePageState();
  }

}

class homePageState extends State<homePage>{

  String font_family = 'AvenirNext';

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text('BigTEXT',
          style: TextStyle(
            fontFamily: font_family,
            fontSize: 35.0,
            fontWeight: FontWeight.normal,
            color: Color(myColors.skyBlue)
          ),),
          elevation: 0.0,
          backgroundColor: Color(myColors.darkSkyBlue),
        ),
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            DisplayChat(),
            textWriting()
          ],
        ),
      )
    );
  }
}