import 'package:flutter/material.dart';
import 'package:misiones/core/mi_app.dart';
import 'package:misiones/providers/misiones_provider.dart';
import 'package:provider/provider.dart';

class MisProviders extends StatelessWidget {
const MisProviders({ super.key });

  @override
  Widget build(BuildContext context){
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => MisionesProvider(),)
    ],
    child:MiApp() ,);
  }
}