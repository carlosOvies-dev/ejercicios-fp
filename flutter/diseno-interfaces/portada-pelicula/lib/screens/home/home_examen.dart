import 'package:exame_venom/model/model_actores.dart';
import 'package:exame_venom/providers/providers_actores.dart';
import 'package:exame_venom/theme/color_indigo.dart';
import 'package:flutter/material.dart';

class HomeExamen extends StatelessWidget {
const HomeExamen({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.lightBlue,
        title: Text("Peliculas populares", style: TextStyle(color: Colors.white)),
      ),
      
      body: Container(
        child: Column(
          children: [
            
            
            Expanded(flex: 2, child: _portada()),
            Expanded(flex: 2, child: _cuerpo()),
            Expanded(flex: 1, child: _descripcion()),
            Expanded(flex: 1, child: _actores())
          ],
        ),
      ),
    );
  }
 
  
  

  Widget _portada(){
    return Container(
    
      width: double.infinity,
      child: Image.asset("assets/principal/imaxe_superior.jpg"
      ,fit: BoxFit.cover,),
      
      
    );
  }

  Widget _cuerpo(){
    return Padding(
      padding: const EdgeInsets.all(9),
      
      child: 
      Row(

        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
        
        children: [
          Container(
          
           clipBehavior: Clip.hardEdge,
           decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
           child: Flexible(
             child: Image.network(
              fit: BoxFit.contain,
              "https://image.tmdb.org/t/p/w500/2jVVDtDaeMxmcvrz2SNyhMcYtWc.jpg",
              
             ),
           ),
          
          ),
          Expanded(flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Venom: Habra matanza",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                Text("Venom: Let There Be Carnage", style: TextStyle(color: ColorIndigo.azul, fontSize: 12),),
                Row(
                  spacing: 3,
                  children: [
                    Icon(Icons.star_border_outlined, size: 10,),
                    Text("6.9" ,style: TextStyle(color: ColorIndigo.azul, fontSize: 10),)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _descripcion(){
    return Padding( 
      padding: EdgeInsetsGeometry.all(20),
      child:  Text(" Eddie Brock (Tom Hardy) y su simbionte Venom todavía están intentando descubrir cómo vivir juntos cuando un preso que está en el corredor de la muerte (Woody Harrelson) se infecta con un simbionte propio."
      ,style: TextStyle(),
      textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _actores(){
    return FutureBuilder(future: miProvider.miLista(), builder: (context, snapshot) {
      if(snapshot.hasError){
        print(snapshot.error);
        return Text("No se cargaron los datos");
      }
      if(snapshot.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator());
      }

      var listActores = snapshot.data!;

      return ListView.separated(itemBuilder: (context, index) {
        var cadaActor = listActores[index];
            return _actor(cadaActor);
      },itemCount: listActores.length,
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 10)),);
    },);
  }


  Widget _actor(ModelActores actor){
    return Container(
      
      child: Column(
        spacing: 5,
        children: [
          Flexible(
            child: CircleAvatar(child: 
            Image.network(actor.url,
            fit: BoxFit.cover,
            
            )),
          ),
          Container(
           width: 70,
            child: Text(actor.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            softWrap: false,),
          )
        ],
      ),
    );
  }
}