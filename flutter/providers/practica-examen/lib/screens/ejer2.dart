import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/click_provider.dart';
import 'package:provider/provider.dart';

class Ejer2 extends StatelessWidget {
  final String mensaje;
const Ejer2({ super.key, required this.mensaje });

  @override
  Widget build(BuildContext context){
   final miProvider = Provider.of<ClickProvider>(listen: false,context);
   
    return Scaffold(
      appBar: AppBar(
        title:  Text(mensaje),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => miProvider.sumar(),
          child: Image.asset("assets/image/descarga.jpeg")),
          GestureDetector(
            onTap: () => miProvider.reseteo(),
            child: Consumer<ClickProvider>(
              builder: (context, provider, child) => 
               Text("NumeroClicks: ${provider.Total}")),
          ),
          Lista()
        
      ],
    )
    );
  }
}

class Lista extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    final miProvider = Provider.of<ClickProvider>(listen: true,context);
    return Expanded(
      child: ListView.builder(itemBuilder: (context, index) {
        var elemento = miProvider.lista[index];
        return Elemento(elemento: elemento);
      },itemCount: miProvider.lista.length,),
    );
  }

}

class Elemento extends StatefulWidget{
  final String elemento;
  final Color  color = Colors.green;
  const Elemento({super.key, required this.elemento});

  @override
  _ElementoState createState() => _ElementoState();
}

class _ElementoState extends State<Elemento>{
  late Color color =Colors.black;
  bool marcado=false;
  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () {
        setState(() {
        color = Colors.amber;  
        });
        
        marcado =!marcado;
      },
      child: Container(
        color: marcado ? color : widget.color,
        child: Text("${widget.elemento}"),
      ),
    );
  }
}

