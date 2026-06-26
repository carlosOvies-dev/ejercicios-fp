import 'package:alumnos/model/model_alumno.dart';
import 'package:alumnos/model/model_curso.dart';
import 'package:alumnos/providers/provider_db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
const Home({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: 
      FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed('form',arguments: ModelAlumno.empty()),),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Alumnos por Curso', style: TextStyle(
          color: Colors.white
        ),),
      ),
      body: Column(
        children: [
          Cursos(),
          ListaAlumnos()
        ],
      ),
    );
  }
}

class ListaAlumnos extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final miProvider = Provider.of<ProviderDb>(context, listen:  true);
    return Expanded(
      child: ListView.builder(
        itemCount: miProvider.alumnos.length,
        itemBuilder: (context, index) {
        final alumno = miProvider.alumnos[index];
      
        return ListTile(
          onTap: () => Navigator.of(context).pushNamed('form',arguments: alumno),
          title: Text("${alumno.nombre} (${alumno.nif} )"),
          subtitle: Text("Repetidor: ${alumno.repetidor ? "SI": "NO"}"),
          trailing: IconButton(icon: Icon(Icons.delete),
          onPressed: () => miProvider.deleteAlumno(alumno),),
        );
      },),
    );
  }
}

class Cursos extends StatefulWidget {
  @override
  State<Cursos> createState() => _CursosState();
}

class _CursosState extends State<Cursos> {
  int? _idcursoSeleccionado;
  late Future<List<ModelCurso>> _cursos;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cursos = Provider.of<ProviderDb>(context,listen: false ).getCursos();
    _idcursoSeleccionado = Provider.of<ProviderDb>(context,listen: false).idCursoElegido;
  }
  @override
  Widget build(BuildContext context) {
  final miProvider = Provider.of<ProviderDb>(context,listen: false);
    return FutureBuilder(future: _cursos, builder: (context, snapshot) {
      if(snapshot.hasError){
        return Center(child: Text("Error al cargar los cursos"));
      }
      if(snapshot.connectionState==ConnectionState.waiting){
        return Center(child: CircularProgressIndicator());
      }

      final cursos = snapshot.data ?? [];

      return DropdownButton(
        value: _idcursoSeleccionado,
        items:[ DropdownMenuItem(
        value: null,
        child: Text("Seleccione un curso")),
        ...cursos.map((curso) => DropdownMenuItem(
          value: curso.id,
          child: Text(curso.nombre)),).toList()
        
        ], onChanged: (value) {
          setState(() {
            _idcursoSeleccionado =value;
            miProvider.idCursoElegido=value;
            if(_idcursoSeleccionado!=null){
              print("Cargar alumnos");
             
              miProvider.getALumnos(_idcursoSeleccionado!);
            }
          });
        },);
    },);
  }
}