import 'package:examen2/provider/contador_provider.dart';
import 'package:examen2/widget/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Eje1 extends StatelessWidget {
const Eje1({ super.key });

  @override
  Widget build(BuildContext context){
    final miProvider = Provider.of<ContadorProvider>(listen: false,context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer<ContadorProvider>(
            builder:(context, provider, child) =>  Text("${provider.getSumas}")),
            SizedBox(width: 10),
            Consumer<ContadorProvider>(builder:(context, provider, child) =>  Text("${provider.getRestas}"))
        ],
        title: const Text('Title'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              _Boton(original: Icons.ac_unit_sharp, remplazo: Icons.access_alarms_sharp, tipo: 'sumar',),
              SizedBox(width: 20,),
              _Boton(original: Icons.accessible_forward_rounded, remplazo: Icons.accessible_sharp, tipo: 'restar',)
            ],
          ),
          Center(child: GestureDetector(
            onDoubleTap: () => Navigator.of(context).pushNamed('eje2', arguments: miProvider.getTam),
            child: ContainerWidget()))
        ],
      ),
    );
  }
}

class _Boton extends StatefulWidget {
  final IconData original ;
  final IconData remplazo;
  final String tipo;
  const _Boton({super.key,required this.tipo ,required this.original, required this.remplazo});
  @override
  State<_Boton> createState() => _BotonState();
}

class _BotonState extends State<_Boton>{
 
  bool marcado= false;
  @override
  Widget build(BuildContext context) {
    final miProvider = Provider.of<ContadorProvider>(listen: false,context);
   return IconButton(onPressed: () {
     setState(() {
       marcado = !marcado;
      if(widget.tipo == "sumar"){
        miProvider.aumentar();
      }else{
        miProvider.restar();
      }
     });
   }, icon: Icon(marcado==true ? widget.original : widget.remplazo));
  }
}