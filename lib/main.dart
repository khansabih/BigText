import 'package:flutter/material.dart';
import 'homePage.dart';
import 'package:firebase_core/firebase_core.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value){
    runApp(new MaterialApp(
      title: 'BobbleBigmauji',
      home: homePage(),
      debugShowCheckedModeBanner: false,
    ));
  });
}