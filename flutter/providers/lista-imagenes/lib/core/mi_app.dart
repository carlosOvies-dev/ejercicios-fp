import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home/home.dart';

class MiApp extends StatelessWidget {
const MiApp({ super.key });

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Home(),
    );
  }
}