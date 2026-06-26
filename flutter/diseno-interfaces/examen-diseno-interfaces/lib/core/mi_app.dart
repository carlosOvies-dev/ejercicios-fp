import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home/home_screen.dart';

class MiApp extends StatelessWidget {
const MiApp({ super.key });

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      darkTheme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}