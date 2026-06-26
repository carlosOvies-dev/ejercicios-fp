import 'package:flutter/material.dart';
import 'package:misiones/providers/misiones_provider.dart';
import 'package:misiones/screen/progreso_screen.dart';
import 'package:provider/provider.dart';

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
          Text("USUARIOS"),
          Expanded(
          
            child: Usuarios()),
        ],
      ),
    );
  }
}

class Usuarios extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   final miProvider =Provider.of<MisionesProvider>(listen: false,context);
   return ListView.separated(itemBuilder: (context, index) {
     var usuario = miProvider.getUsuarios[index];
      return Usuario(nombre: usuario, indice: index,);
   }, separatorBuilder: (context, index) => SizedBox( height: 10), itemCount: miProvider.getUsuarios.length);
  }
}

class Usuario extends StatelessWidget{
  final String nombre;
  final int indice;
  const Usuario({super.key, required this.nombre, required this.indice});
   @override
  Widget build(BuildContext context) {
    final miProvider = Provider.of<MisionesProvider>(listen: true,context);
    int indiceMision = miProvider.getIndices[indice];
    return ListTile(
      onLongPress: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProgresoScreen(usuario: nombre),));
      },
      onTap: () {
        miProvider.setSeleccionado(indice);
      },
      leading: Icon(Icons.verified_user),
      title: Text(nombre),

      subtitle: Column(
        children: [
          miProvider.getIndices[indice] == -1 ? Text("Sin misiones") : Text("Mision Actual: ${miProvider.getMisiones[indiceMision]}"),
           Text("Ciclos: ${miProvider.getCiclos[indice]}"),
        ],
      ),
      
    );
  }
 
}
