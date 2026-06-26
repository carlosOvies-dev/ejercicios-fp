import 'package:examen_piano/model/model_piano.dart';
import 'package:examen_piano/providers/provider_piano.dart';
import 'package:examen_piano/screen/screen_formulario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenLista extends StatelessWidget {
const ScreenLista({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScreenFormulario(),));
      },),
      appBar: AppBar(
        title: const Text('Lista de Pianos'),
      ),
      body: Column(
        children: [
          Expanded(child: _pianos()),
          SizedBox()
        ],
        
      ),
    );
  }
}

class _pianos  extends StatelessWidget {
const _pianos({ super.key });

  @override
  Widget build(BuildContext context){
    final miProvider = Provider.of<ProviderPiano>(listen: true, context);
    return FutureBuilder(future: miProvider.pianosDB(), builder: (context, snapshot) {
      if(snapshot.hasError){
        print(snapshot.error);
        return Center(child: Text("Error al cargar datos",style: TextStyle(color: Colors.red),));
      }
      if(snapshot.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator());
      }

      final lista = snapshot.data!;

      if(lista.isEmpty){
        return Text("NO HAY PIANOS");
      }

      return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
        final piano = lista[index];
        return _cadaPiano(piano: piano);
      },);
    },);
  }
}

class _cadaPiano  extends StatelessWidget {
  final ModelPiano piano;
const _cadaPiano({ super.key , required this.piano});

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      child: GestureDetector(
        onDoubleTap: () {
          final miProvider = Provider.of<ProviderPiano>(context ,listen: false);
          miProvider.borrarPiano(piano);
        },
        child: Column(
          children: [
            Text(piano.modelo),
            Text("${piano.prezo}-Novo: ${piano.novo ? "SI" : "NO"}")
          ],
        ),
      ),
    );
  }
} 

