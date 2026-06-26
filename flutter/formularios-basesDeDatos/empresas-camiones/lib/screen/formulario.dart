import 'package:camiones/model/model_camion.dart';
import 'package:camiones/providers/provider_db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Formulario extends StatefulWidget {
  const Formulario({ super.key });

  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  ModelCamion camionNuevo = ModelCamion.empty();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controlMatricula = TextEditingController();
  final TextEditingController _crtCV = TextEditingController();
   String? _estadoSeleccionado;
   bool _altacapacidad = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Añadir Camion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              spacing: 5,
              children: [
                _matricula(),
                _cv(),
                _estados(),
                _capacidad(),
                _guardar()

              ],
            ),
          )),
      ),
    );
  }
  
  Widget _matricula() {
    return TextFormField(
      controller: _controlMatricula,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        labelText: "Matricula",
        hint: Text("Deben ser 7 caracteres")
      ),
      validator: (value) {
        if(value == null || value.isEmpty ){
          return 'Campo obligatorio';
        }
        if(value.length !=7 ){
          return 'Deben de ser 7 caracteres';
        }
        return null;
      },
    );
  }
  
 Widget _cv() {
  return TextFormField(
    controller: _crtCV,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      labelText: 'CV'
    ),
    validator: (value) {
      if(value == null || value.isEmpty){
        return "Es obligatorio";

      }
      final numero = int.tryParse(value);
      if(numero == null){
        return "Tiene que ser un numero";
      }
      if(value.length !=3){
        return "Debe de tener 3 cifras";
      }
      return null;
    },
  );
 }
 
 Widget _estados() {
  final estados = Provider.of<ProviderDb>(listen: false, context).getEstados;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Estado del camion"),
      ...estados.map((estado) {
       return RadioListTile<String>(
        title: Text(estado),
        value: estado,
        groupValue: _estadoSeleccionado,
        onChanged: (value) {
          setState(() {
            _estadoSeleccionado = value;
          });
        },); 
      },).toList(),
    ],
  );

 }
 
 Widget _capacidad() {
  return CheckboxListTile(
    title: Text("Alta capacidad"),
    value: _altacapacidad,
   onChanged:(value) {
    setState(() {
     _altacapacidad = value!; 
    });
     
   }, );
 }
 
 Widget _guardar() {
  final miProvider = Provider.of<ProviderDb>(listen: false,context);
  return ElevatedButton(onPressed: () {
    if(_formKey.currentState!.validate()){

      if(_estadoSeleccionado == null){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Debes seleccionar un estado"))
        );
        return;
      }
      camionNuevo.matricula = _controlMatricula.text;
      camionNuevo.cv = int.parse(_crtCV.text);
      camionNuevo.estado = _estadoSeleccionado!;
      camionNuevo.alta_capacidad = _altacapacidad;
      camionNuevo.asociacion_id = miProvider.idSeleccionado;
        miProvider.addCamion(camionNuevo);
      Navigator.pop(context);
    }
  }, child: Text("Guardar"));
 }
}