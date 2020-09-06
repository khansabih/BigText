import 'package:bobble_bigmauji/ColorPalette/myColors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class DisplayChat extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new DisplayChatState();
  }

}

class DisplayChatState extends State<DisplayChat>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(bottom: 75.0),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('numbers').orderBy('time',descending: true).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if (snapshot.hasError)
            return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
          // case ConnectionState.waiting: return Center(
          // child: new CircularProgressIndicator(
          //   backgroundColor: Colors.blue.shade900,
          // ),);
            default:
              return Container(
                alignment: Alignment.centerRight,
                child: new ListView(
                  reverse: true,
                  children: snapshot.data.docs.map((DocumentSnapshot document) {
                    print('${document.data()['text']}');
                    return Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 20.0,right: 20.0,bottom: 10.0,top: 10.0),
                      child: Text('${document.data()['text']}',
                      style: TextStyle(
                        fontSize: double.parse('${document.data()['fontSize']}'),
                        color: Color(myColors.darkSkyBlue)
                      ),),
                    );

                  }).toList(),
                ),
              );

          }
        },
      ),
    );
  }
}