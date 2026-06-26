import 'package:flutter/material.dart';

class Contenedor extends StatefulWidget{
   final double texto ;
   final double aumentos;
   const Contenedor({super.key , required this.aumentos,required this.texto});
  @override
  State<Contenedor> createState() => _ContenedorState();
    
}

class _ContenedorState extends State<Contenedor>{
   double tamano=0;

  @override
  void initState() {
    
    super.initState();
    tamano = widget.aumentos;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          tamano = 50;
        });
      },

      onTap: () { 
        setState(() {
          tamano += widget.texto;  
        });
        
      },
      child: Container(
        
        width: 50,
        height: tamano,
        color: tamano >= 200 ? Colors.green : Colors.red,
        child: Text("Lo que mide ${tamano} Aumentar en ${widget.texto}", style: TextStyle(fontSize: 15, color: Colors.black)),
        
      ),
    );
  }
}