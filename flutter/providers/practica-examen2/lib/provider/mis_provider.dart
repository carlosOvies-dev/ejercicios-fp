import 'package:examen2/core/mi_app.dart';
import 'package:examen2/provider/contador_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MisProvider extends StatelessWidget {
const MisProvider({ super.key });

  @override
  Widget build(BuildContext context){
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ContadorProvider(),)
    ],
    child: MiApp(),);
  }
}