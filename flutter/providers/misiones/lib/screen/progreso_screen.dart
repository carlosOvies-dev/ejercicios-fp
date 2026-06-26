import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:misiones/providers/misiones_provider.dart';
import 'package:provider/provider.dart';

class ProgresoScreen extends StatelessWidget {
  final String usuario;
const ProgresoScreen({ super.key, required this.usuario });

  @override
  Widget build(BuildContext context){
    final miP = Provider.of<MisionesProvider>(listen: false,context);
    int indice= miP.getUsuarios.indexOf(usuario);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Container(
        child: Column( 
           children: [
            Consumer<MisionesProvider>(builder: (context, provider, child) {
              return Column(
                children: [
                  Text("Usuario: ${provider.getUsuarios[indice]}"),
                  Text("Ciclos completador ${provider.getCiclos[indice]}"),
                  provider.getCiclos[indice]<3 ?  Text("Disponible", style: TextStyle(color: Colors.green)) 
                  : Text("Ocupado",style: TextStyle(color:Colors.red ))  
                ]
                 ,);
            }),
            ElevatedButton(onPressed: () {
              miP.darMision(indice);

             }, child: Text("Avanzar mision"))
                ],
              
              )
      )
    );
    
            } 
            
}            