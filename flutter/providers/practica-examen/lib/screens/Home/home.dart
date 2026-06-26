import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/ejer1.dart';
import 'package:flutter_application_1/screens/ejer2.dart';

class Home extends StatelessWidget {
const Home({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Column(
        children: [
          Expanded(child: TextButton(onPressed:() => Navigator.push(context,MaterialPageRoute(builder: (context) => Ejer1())), child: Text("Ejercicio 1"))),
          Expanded(child: TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Ejer2(mensaje: "",),)), child: Text("Ejercicio 2")))
        
        ],
      ),
    );
  }
}