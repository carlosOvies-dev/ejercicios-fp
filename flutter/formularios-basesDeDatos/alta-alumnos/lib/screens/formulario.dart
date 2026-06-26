import 'package:alumnos/model/model_alumno.dart';
import 'package:alumnos/model/model_curso.dart';
import 'package:alumnos/providers/provider_db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Formulario extends StatelessWidget {
const Formulario({ super.key });

  @override
  Widget build(BuildContext context){
    ModelAlumno alumno = ModalRoute.of(context)!.settings.arguments as ModelAlumno;
    return Scaffold(
    
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: alumno.id == null  ? 
        Text('Alta alumno',style: TextStyle(color: Colors.white)) :
        Text('Modificar alumno',style: TextStyle(color: Colors.white)),
      ),
      body: Campos( alumno: alumno,),
    );
  }
}

class Campos extends StatefulWidget {
  ModelAlumno alumno;
  Campos({ required this.alumno});
  @override
  State<Campos> createState() => _CamposState();
}

class _CamposState extends State<Campos> {
  final fromKey = GlobalKey<FormState>();
  late TextEditingController _contNif;
  late TextEditingController _contNombre;
  late bool _contRepetidor;
  late int _idCurso; 
   String _nombreCurso ="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _contNif =TextEditingController(text: widget.alumno.nif);
    _contNombre = TextEditingController(text: widget.alumno.nombre);
    _contRepetidor = widget.alumno.repetidor;
    _idCurso = widget.alumno.curso_id;
    
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: fromKey,
      
      child: SingleChildScrollView(
        child: Column(
          children: [
            _campoNif(),
            _campoNombre(),
            _campoRepetidor(),
            _camporCursos(),
            _guardar()
          ],
        ),
      ));
  }
  
 Widget _campoNif() {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUnfocus,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      hint: Text("NIF"),
      label: Text("NIF (9 caracteres)")
    ),
    maxLength: 9,
    controller: _contNif,
    validator: (value) {
      if(value== null || value.isEmpty){
        return "El campos es obligatorio";
      }
      if(value.length!=9){
        return "El nif tiene que tener 9 caracteres";
      }
      return null;
    },
    onChanged: (value) {
      setState(() {
        _contNif.text =value;
      });
    },
  );
 }
 
 Widget _campoNombre() {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUnfocus,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      hint: Text("Nombre"),
      label: Text("Nombre (max 50)")

    ),
    maxLength: 50,
    controller: _contNombre,
    validator: (value) {
      if(value== null || value.isEmpty){
        return "El campo es obligatorio";
      }
      if( value.length<3){
        return "El nombre debe de contener 3 caracteres minimo";
      }
    },
  );
 }
 
 Widget _campoRepetidor() {
  return SwitchListTile(
    title: Text("Repetidor"),
    value: _contRepetidor, onChanged:(value) {
      setState(() {
        _contRepetidor =! _contRepetidor;
      });
    },
     
     );
 }
 
 Widget _camporCursos() {
  final miProvider = Provider.of<ProviderDb>(listen: false,context);
  return Column(
    children: [
      ...List.generate(miProvider.cursos.length, (index) {
       return RadioListTile(value: miProvider.cursos[index].id,
        title: Text(miProvider.cursos[index].nombre),
        
        groupValue: _idCurso,
        onChanged: (value) {
          setState(() {
            if(value!=null){
              _idCurso = value!;
            }
            
          });
        },
        );
      },)
    ],
  );
 }
 
 Widget _guardar() {
  
  return ElevatedButton(onPressed: () async{
    if(fromKey.currentState!.validate()){
      widget.alumno.nif = _contNif.text;
      widget.alumno.nombre= _contNombre.text;
      widget.alumno.repetidor= _contRepetidor;
      widget.alumno.curso_id=_idCurso;  
      final miProvider = Provider.of<ProviderDb>(context,listen: false);
            
      if(widget.alumno.id== null) {
        miProvider.addAlumno(widget.alumno);
       //  _nombreCurso = await miProvider.getCurso(_idCurso);
       
       _nombreCurso = miProvider.cursos.firstWhere((curso) => curso.id == _idCurso,).nombre;
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Alumno: ${widget.alumno.nombre}, ha sido añadido al curso ${_nombreCurso}")));
      }else{
        miProvider.updateAlumno(widget.alumno);
      }

     
     Navigator.of(context).pop();

    }
  }, child: Text("Guardar"));
 }
}