import 'package:examen/model/camion.dart';
import 'package:examen/providers/camiones_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pantalla1 extends StatefulWidget {
const Pantalla1({ Key? key }) : super(key: key);

  @override
  State<Pantalla1> createState() => _Pantalla1State();
}

class _Pantalla1State extends State<Pantalla1> {
  String mensaje="";
  @override
  Widget build(BuildContext context){
    final miProvider = Provider.of<CamionesProvider>(listen: false,context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer<CamionesProvider>( builder: (context, value, child) {
            return Row(
              children: [
                Text("Totales: ${value.getCamiones.length}"),
                SizedBox(),
                Text("Borrados: ${value.getBorrados.length}")
              ],
            );
          },)
        ],
        title: const Text('Lista camiones'),
      ),
      body: Column(
        children: [
          Expanded(child: _ListaCamiones()),
          ElevatedButton(onPressed:() async{
            final recibido =await Navigator.of(context).pushNamed('p2', arguments:miProvider.getBorrados );
            if(recibido!=null){
              setState(() {
                mensaje = recibido.toString();
              });
            }
          } , child: Text("Enviar")),
          Expanded(child: Text(mensaje.isNotEmpty ? mensaje : ""))
        ],
      ),
    );
  }
}

class _ListaCamiones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final miProvider = Provider.of<CamionesProvider>(listen: true,context);
    return ListView.builder(
      itemCount: miProvider.getCamiones.length,
      itemBuilder: (context, index) {
      final camion =miProvider.getCamiones[index];
      return _ElementoLista(camion: camion,);
    },);
  }
}

class _ElementoLista extends StatefulWidget {
  double sizeInicial=10;
  double sizeAumento=5;
  Camion camion;
  bool marcado = false;
  _ElementoLista({required this.camion});
  @override
  State<_ElementoLista> createState() => _ElementoListaState();
}

class _ElementoListaState extends State<_ElementoLista> {
  late double sizeInicial;
  late double sizeAumento;
  
  late bool marcado ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sizeInicial = widget.sizeInicial;
    sizeAumento = widget.sizeAumento;
    marcado =widget.marcado;
  }
  @override
  Widget build(BuildContext context) {
   final miProvider = Provider.of<CamionesProvider>(listen: false,context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        GestureDetector(
          onLongPress:() {
             miProvider.borrar(widget.camion);
          },
           onTap: () {
             setState(() {
              marcado = !marcado;
   
             });
           }
          ,
          child: Text(widget.camion.matricula, style: TextStyle(color: marcado ? Colors.black : Colors.green),)),

        GestureDetector(
          onTap: () {
            setState(() {
              if(sizeInicial < 25){
                sizeInicial += sizeAumento;
              }else{
                sizeInicial=10;
              }
            });
          },
          child: Text("Alta capacidad ${widget.camion.alta_capacidad? "SI" : "NO"}", style: TextStyle(fontSize: sizeInicial),))
      ],
    );
  }
}