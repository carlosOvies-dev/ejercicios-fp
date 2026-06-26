import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/mi_app.dart';
import 'package:flutter_application_1/providers/foto_provider.dart';
import 'package:provider/provider.dart';

class MisProviders extends StatelessWidget {
const MisProviders({ super.key });

  @override
  Widget build(BuildContext context){
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => FotoProvider())
    ],
    child: MiApp(),);
  }
}