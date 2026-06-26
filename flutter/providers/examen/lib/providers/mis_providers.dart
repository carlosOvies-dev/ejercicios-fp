import 'package:examen/core/mi_app.dart';
import 'package:examen/providers/camiones_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MisProviders extends StatelessWidget {
const MisProviders({ super.key });

  @override
  Widget build(BuildContext context){
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => CamionesProvider())
    ],
    child: MiApp(),);
  }
}