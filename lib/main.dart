import 'package:emoji_bulmaca/pages/main_page/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //#FFDFD3
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Emoji Bulmaca',
      theme: ThemeData(
        //scaffoldBackgroundColor: HexColor("#D6CFFC"),
        primarySwatch: Colors.blue,
        backgroundColor: Colors.black,
      ),
      home: const MainPage(),
    );
  }
}
