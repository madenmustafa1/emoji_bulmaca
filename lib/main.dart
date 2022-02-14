
import 'package:emoji_bulmaca/pages/main_page/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:cloud_firestore/cloud_firestore.dart';



void main() async {

 WidgetsFlutterBinding.ensureInitialized();
 
  await Firebase.initializeApp(
    
    //options:  DefaultFirebaseOptions.currentPlatform,
  );
  

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Emoji bulmaca',
      //scaffoldBackgroundColor: HexColor("#333333"),
      theme: ThemeData(
        scaffoldBackgroundColor: HexColor("#A096E0"),
        primarySwatch: Colors.blue,
        backgroundColor: Colors.black,
      ),
      home: const MainPage(),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
