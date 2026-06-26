import 'package:camiones/providers/provider_db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
const Home({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
        Navigator.of(context).pushNamed('formulario');
      },),
      appBar: AppBar(
        title: const Text('Flotas de Camiones'),
      ),
      body: Column(
        children: [
          Asociaciones(),
          Camiones(),
        ],
      ),
    );
  }
}

class Camiones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   final miProvider = Provider.of<ProviderDb>(listen: true, context);

   return FutureBuilder(future: miProvider.actCamiones(miProvider.idSeleccionado), builder: (context, snapshot) {
     if(snapshot.hasError){
      return Center(child: Text("Error DB Camiones", style: TextStyle(color: Colors.red),));
     }
     if(snapshot.connectionState == ConnectionState.waiting){
      return Center(child: CircularProgressIndicator());
     }

     final camiones = snapshot.data ?? [];

     if(camiones.isEmpty){
      return Center(child: Text("Esta asociacion no tiene camiones"));
     }

     return Expanded(
       child: ListView.builder(
        itemCount: camiones.length,
        itemBuilder: (context, index) {
       
          final camion = camiones[index];
         return ListTile(
          title: Text(camion.matricula),
          subtitle: Text("Alta capacidad: ${camion.alta_capacidad ? 'SI':'NO'}"),
          onTap: () async{
            miProvider.eliminarCamion(camion);
          },
         );
       },),
     );
   },);

  }
}

class Asociaciones extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final miProvider = Provider.of<ProviderDb>(context,listen: true);
    return FutureBuilder(future: miProvider.actAsociaicones(), builder: (context, snapshot) {
      if(snapshot.hasError){
        return Center(child: Text("Error al cargar base de datos Asociaciones", style: TextStyle(color: Colors.red),));
      }
      if(snapshot.connectionState== ConnectionState.waiting){
        return Center(child: CircularProgressIndicator());
      }

      final asociaciones = snapshot.data ?? [];

      return DropdownButton(
        barrierDismissible: false,
        isExpanded: true,
        hint: Text("Selecciona una asociacion"),
        value:  miProvider.idSeleccionado,
        items: asociaciones.map((e) => DropdownMenuItem(value: e.id ,child: Text(e.nome)),).toList(), 
      onChanged: (value) {
        miProvider.seleccionar(value!);
      },);


    },);
  }
}