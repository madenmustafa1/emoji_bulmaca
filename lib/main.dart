import 'package:emoji_bulmaca/pages/main_page/main_page.dart';
import 'package:emoji_bulmaca/utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

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
      theme: ThemeData(
        scaffoldBackgroundColor: HexColor("#A096E0"),
        primarySwatch: Colors.blue,
        backgroundColor: Colors.black,
      ),
      home: const MainPage(),
    );
  }
}
