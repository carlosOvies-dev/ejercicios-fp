import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/model_noticia.dart';
import 'package:flutter_application_1/providers/providers_noticia.dart';
import 'package:flutter_application_1/theme/tipo_letra.dart';

class HomeScreen extends StatelessWidget {
const HomeScreen({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      
      body: Column(
        
        children: [
          
          Expanded(flex: 3, child: _superior()),
          Expanded(flex: 3, child: _nova()),
          Expanded(flex: 4, child: _noticias())

        ],
      ),
    );
  }


  Widget _superior(){
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),),
      child: Image.asset("assets/imaxes/publicidade.JPG",
      fit: BoxFit.cover,
      )
    );
  }

Widget _nova(){
  return Container(
    padding: EdgeInsets.all(10),
    
    child: Column(
    
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
     
      children: [
        Text("Abascal da oxígeno a Mazón y le permite tramitar los presupuestos",
         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
         Text("Laura Martínez — València", style: TipoLetra.letra,),
         Text("- La jueza de la DANA cita a declarar como imputada el 11 de abril a Salomé Pradas y el 14 como testigo a Pilar Bernabéeeee", 
         overflow: TextOverflow.ellipsis,
         maxLines: 2,),
         Text("- El PP de Feijóo hace suyo el acuerdo de Mazón con Vox que pide acabar con el Pacto Verde Europeo que apoyaronnnnnn",
         overflow: TextOverflow.ellipsis,
         maxLines: 2,)
      ],
    ),
  );
}

Widget _noticias(){
  return FutureBuilder(
    
    future: miProvider.miLista(), builder: (context, snapshot) {
    if(snapshot.hasError){
      print(snapshot.error);
      return Text("Ha habido este error ${snapshot.error}",style: TextStyle(color: Colors.red),);
    }
    if(snapshot.connectionState == ConnectionState.waiting){
      return Center(child: CircularProgressIndicator());
    }
  
    var lista = snapshot.data ?? [];
  
    return ListView.separated(itemBuilder: (context, index) {
      var noticia = lista[index];
     if (noticia.url.contains("JPG")){
          return _noticiaLocal(noticia);
     }else{
       return _noticia(noticia);
     }
     
      
      
    }, separatorBuilder: (context, index) => Padding(padding: EdgeInsetsGeometry.only(right: 5)),
     itemCount: lista.length,
     scrollDirection: Axis.horizontal,
     );
  },);
}

 Widget _noticia(ModelNoticia model){
  return Container(
      width: 200,
      margin: EdgeInsets.all(10),
      
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      
      children: [
        Image.network(model.url,) ,
        Text(model.texto, style: TextStyle(color: Colors.brown),textAlign: TextAlign.justify,),
        
        Text(model.autor, style: TipoLetra.letra,)
      ],
    ),
  );
 }
 Widget _noticiaLocal(ModelNoticia model){
  return Container(
    
      width: 200,
      margin: EdgeInsets.all(10),
    child: Column(
      
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset("assets/imaxes/${model.url}"),
        Text(model.texto, style: TextStyle(color: Colors.brown,fontSize: 12),textAlign: TextAlign.justify,),
        
        Text(model.autor, style: TipoLetra.letra,)
      ],
    ),
  );
 }
}