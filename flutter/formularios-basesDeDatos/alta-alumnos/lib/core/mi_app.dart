import 'package:alumnos/screens/formulario.dart';
import 'package:alumnos/screens/home/home.dart';
import 'package:alumnos/services/services_db.dart';
import 'package:flutter/material.dart';

class MiApp extends StatefulWidget {
  const MiApp({ super.key });

  @override
  _MiAppState createState() => _MiAppState();
}

class _MiAppState extends State<MiApp> {
  @override
  void dispose() {
   ServicesDb.miDB.cerrarDb();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home':(_) => Home(),
        'form': (_)=> Formulario()
      },
    );
  }
}