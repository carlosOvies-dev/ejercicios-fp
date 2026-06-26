import 'package:flutter/material.dart';

class SegundaScreen extends StatelessWidget {
const SegundaScreen({ super.key });

  @override
  Widget build(BuildContext context){
    var datos = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    final barra = datos['barra'];
    final porcentaje = datos['porcentaje'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Limite alcanzado'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("No puedes modificar tanto un mismo elemento de momento. Has llegado al límite en la Barra ${barra} y su valor actual es ${porcentaje} %"),
            ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: Text("VOLVER"))
          ],
        ),
      ),
    );
  }
}