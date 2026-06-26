import 'package:flutter/material.dart';
import 'package:reservas/screens/home/home_screen.dart';

class MiApp extends StatelessWidget {
const MiApp({ super.key });

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}