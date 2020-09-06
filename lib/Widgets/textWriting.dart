import 'package:bobble_bigmauji/ColorPalette/myColors.dart';
import 'package:bobble_bigmauji/homePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class textWriting extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new textWritingState();
  }

}

class textWritingState extends State<textWriting>{

  //Text field controller to obtain the text entered by user in the textfield.
  final TextEditingController textToDisplay = new TextEditingController();

  //Initial state of fontsize
  double fontSize = 15.0;

  //State of button whether it is pressed or not currently not pressed.
  int isButtonPressed = 0;

  //To make sure if any other loop, if any is not active
  bool activeLoop = false;

  //Utility function to change the font size.
  void changeFontSize() async{
    if (activeLoop) return;
    activeLoop = true;

    //Until and unless the button is pressed, the loop will keep on executing.
    while (isButtonPressed == 1) {
      //Increase the font size by 1
      if(fontSize <= 150){
        setState(() {
          fontSize = fontSize+1;
        });
      }

      // wait a bit
      await Future.delayed(Duration(milliseconds: 200));
    }
    activeLoop = false;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
      bottom: 10.0,
      left: 7.0,
      right: 7.0,
      child: Container(
        child: Row(
          children: <Widget>[
            Flexible(
              child: Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(45.0)),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0,1),
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 3.0
                      )
                    ]
                ),
                child: TextField(
                  controller: textToDisplay,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type here...',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontStyle: FontStyle.italic
                      )
                  ),
                  style: TextStyle(
                    fontSize: fontSize,
                  ),
                ),
              ),
            ),

            SizedBox(width: 8.0,),

            Listener(
              child: Icon(Icons.send,size: 25.0,color: Color(myColors.darkSkyBlue),),
              onPointerDown: (details){
                setState(() {
                  isButtonPressed = 1;
                });
                if(textToDisplay.text.isNotEmpty)
                  changeFontSize();
              },
              onPointerUp: (details){
                setState(() {
                  isButtonPressed = 0;
                });
                if(textToDisplay.text.isNotEmpty) {
                  FirebaseFirestore.instance.collection('numbers').add({
                    'text': textToDisplay.text.toString(),
                    'fontSize': fontSize,
                    'time': DateTime
                        .now()
                        .millisecondsSinceEpoch
                  }).then((value) {
                    setState(() {
                      textToDisplay.text = "";
                      fontSize = 15.0;
                    });
                  }).catchError((error) {
                    debugPrint(error);
                  });
                }

              },
            )

          ],
        ),
      ),
    );
  }
}