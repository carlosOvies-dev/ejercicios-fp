import 'package:camiones/core/mi_app.dart';
import 'package:camiones/providers/provider_db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MisProviders extends StatelessWidget {
const MisProviders({ super.key });

  @override
  Widget build(BuildContext context){
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ProviderDb(),)
    ]
   , child: MiApp(),);
  }
}