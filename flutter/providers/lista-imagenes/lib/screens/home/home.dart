import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/foto_provider.dart';
import 'package:flutter_application_1/widgets/miniatura_foto.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
const Home({ super.key });

  @override
  Widget build(BuildContext context){
    final miProvider = Provider.of<FotoProvider>(listen: false,context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: MiniaturaFoto(imagen: "assets/image/faro.jpg", nombre: "Faro 1")),
              Expanded(child: MiniaturaFoto(imagen: "assets/image/faro1.jpeg", nombre: "Faro 2")),
              Expanded(child: MiniaturaFoto(imagen: "assets/image/faro2.jpg", nombre: "Faro 3"))
            ],
          ),
            Consumer<FotoProvider>(builder: (context, provider, child) => 
               provider.getImagen.isEmpty ? Text("Selecciona una imagen") : Text("Imagen seleccionada: ${miProvider.getNombre} - Cambio: ${miProvider.numCambios}")),
            _FotoPrincipal(),
            _Lista()   
                   
        ],
      ),
    );
  }
}

class _Lista extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   final miProvider = Provider.of<FotoProvider>(listen: true,context);
    return Expanded(
      child: ListView.builder(itemBuilder: (context, index) {
        var elemento = miProvider.getLista[index];
        return _CadaElemento(elemento: elemento);
      },
      itemCount: miProvider.getLista.length,));
  }
}

class _CadaElemento extends StatefulWidget{
  final String elemento;
  const _CadaElemento({super.key, required this.elemento});

  @override
  State<_CadaElemento> createState() => _CadaElementoState();
}

class _CadaElementoState extends State<_CadaElemento>{
  Color color = Colors.white;
  bool marcado = false;
  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () {
        setState(() {
        marcado = !marcado;
        if(marcado == true){
          color = Colors.amberAccent;
        }  else{
          color = Colors.white;
        }
        });
        
      },
      child: Container(
        
        color: color,
        child: Text(widget.elemento),
      ),
    );
  }
}

class _FotoPrincipal extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   final miProvider = Provider.of<FotoProvider>(listen: true,context);
   if(miProvider.getImagen.isEmpty){
    return SizedBox();
   }
    return Container(
      
      child: Image.asset(miProvider.getImagen));
  }
}