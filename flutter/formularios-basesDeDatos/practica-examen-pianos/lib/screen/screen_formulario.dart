import 'package:examen_piano/model/model_piano.dart';
import 'package:examen_piano/providers/provider_piano.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenFormulario extends StatefulWidget {
  const ScreenFormulario({ super.key });

  @override
  _ScreenFormularioState createState() => _ScreenFormularioState();
}

class _ScreenFormularioState extends State<ScreenFormulario> {
  ModelPiano pianoNuevo = ModelPiano.empty();
  final key = GlobalKey<FormState>();
  late TextEditingController precioController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    precioController = TextEditingController(text: pianoNuevo.prezo?.toString() ?? "");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alta Piano'),
      ),
      body: Form(
        key: key,
        child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(hintText: "Modelo"),
            initialValue: pianoNuevo.modelo,
            
            maxLength: 25,
          
            validator: (value) {
              if(value== null){
                return "Campo obligatorio";
              }
              if(value.length > 25){
                return "Tamaño maximo 25";
              }
              if(value.length < 4 ){
                return "Tamaño minimo 4";
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                  pianoNuevo.modelo=value;
              });
            },
          ),
          SizedBox(),
          TextFormField(
            decoration: InputDecoration(hintText: "Año de compra"),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            initialValue: pianoNuevo.ano_compra == null ? "" : pianoNuevo.ano_compra.toString(),
            keyboardType: TextInputType.number,
            maxLength: 4,
            validator: (value) {
             
              if(value == null || value.isEmpty){
                return "Debe introducir un año";

              }
              if(value.length !=4){
                return "Debe poner los 4 digitos del año";
              }
               if(int.tryParse(value) == null){
                return "Tiene que ser un numero";
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                pianoNuevo.ano_compra = int.tryParse(value);
              });
            },
          ),
          SizedBox( height: 4,),
          CheckboxListTile(
            title: Text("Piano nuevo?"),
            value: pianoNuevo.novo, onChanged: (value) {
              setState(() {
                pianoNuevo.novo = value! ;
              });
            },),
            SizedBox(),
            TextFormField(
              controller: precioController,
              decoration: InputDecoration(hintText: "Precio"),
             
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if(value == null){
                  return "El precio es obligatorio";
                }
                double? precio = double.tryParse(value);
                if(precio == null){
                  return "Debe poner numeros";
                }
                if(precio < 0){
                  return "No puede ser un valor negativo";
                }
                if(precio > 984){
                  return "El precio debe de ser inferior a 985";
                }
                return null;
              },
            ), 
            SizedBox(),
            ElevatedButton(onPressed: () async {
              if(key.currentState!.validate()){
                pianoNuevo.prezo = double.tryParse(precioController.text);
                final miProvider = Provider.of<ProviderPiano>(context,listen: false);

                int idNuevo = await miProvider.addPiano(pianoNuevo);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("ID creado ${idNuevo}")));
                Navigator.of(context).pop();

              }
            }, child: Text("Guardar"))
        ],
      )
      ),
      );
    
  }
 
}