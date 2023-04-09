import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/Style/My_Theme_Data.dart';
import 'package:todo/layout/Screens/homePage.dart';
import 'package:todo/moduls/MyProvider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) {
      return MyProvider();
    },
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    getShared();
    return MaterialApp(
      routes: {
        homePage.id: (context) => homePage(),
      },
      initialRoute: homePage.id,
      theme: pro.theme,
      darkTheme: MyThemeData.darkTheme,
    );
  }

  Future<void> getShared() async {
    var pro = Provider.of<MyProvider>(context);
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('theme') == 'light') {
      pro.ChangeTheme(MyThemeData.Lighttheme);
    } else {
      pro.ChangeTheme(MyThemeData.darkTheme);
    }
  }
}
