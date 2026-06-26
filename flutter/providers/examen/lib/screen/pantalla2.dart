import 'package:examen/model/camion.dart';
import 'package:examen/providers/camiones_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pantalla2 extends StatelessWidget {
const Pantalla2({ super.key });

  @override
  Widget build(BuildContext context){
     final miProvider = Provider.of<CamionesProvider>(listen: true,context);
    List<Camion> camiones = ModalRoute.of(context)!.settings.arguments as List<Camion>;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer<CamionesProvider>(builder: (context, value, child) {
            return Row(
              children: [
                Text("Totales: ${value.getCamiones.length}"),
                SizedBox(),
                Text("Borrados: ${value.getBorrados.length}")
              ],
            ); })
  
          ,IconButton( 
          onPressed: () async{
            final respuesta =await _dialog(context);
         
           respuesta == 1 ? Navigator.of(context).pop() : null;
          },
          icon:  Icon(Icons.door_back_door))],
        title: const Text('Camiones borrados'),
      ),
      body: ListView.builder(
        itemCount: camiones.length,
        itemBuilder: (context, index) {
        final camion = camiones[index];
        return GestureDetector(
          onDoubleTap: () {
            miProvider.addCamion(camion);
          },
          onTap: () {
            Navigator.of(context).pop(camion.matricula);
          },
          child: Text(camion.matricula));
      },),
    );
  }
  
 Future<int?> _dialog(BuildContext context) {
  int respuesta= 0;
  return showDialog(context: context, builder: (context) {
    return AlertDialog(
      title: Text("Quieres vovler a la pantalla anterior?"),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(1), child: Text("Si")),
        TextButton(onPressed: () =>Navigator.of(context).pop(0), child: Text("No"))
      ],
     
    );
  },);
 }
}