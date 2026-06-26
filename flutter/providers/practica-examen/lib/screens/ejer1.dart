import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/contenedor.dart';
import 'package:flutter_application_1/screens/ejer2.dart';

class Ejer1 extends StatefulWidget {
const Ejer1({ super.key });

  @override
  State<Ejer1> createState() => _Ejer1State();
}

class _Ejer1State extends State<Ejer1> {
 List<double> aumentos =[10,20,30];
 List<double> tamano =[10,20,30];
  Color color= Colors.red;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: Expanded(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              setState(() {
              
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => Ejer2(mensaje: "mensaje",)));
                 
                  
                
              });
            }, child: Text("Preme")),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center, 
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 10,
              children: [
                Expanded(child: Contenedor(aumentos: aumentos[0],texto: tamano[0],)),
                Expanded(child: Contenedor(aumentos: aumentos[1],texto: tamano[1])),
                Expanded(child: Contenedor(aumentos: aumentos[2],texto: tamano[2]))
              ],
            )
          ],
        ),
      ),
    );
  }
}