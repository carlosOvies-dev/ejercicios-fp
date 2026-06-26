import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:examen_peliculas/model/model_pelicula.dart';
import 'package:examen_peliculas/providers/providers_pelicula.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
const HomeScreen({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Examen deseño', style: TextStyle(color: Colors.white),),
            Spacer(),
            Icon( Icons.ac_unit,color: Colors.white,),
            Icon(Icons.timer,color:  Colors.white)
          ],
        ),
        backgroundColor: Colors.lightBlue,
        
      ),
      body: Column(
        children: [
          Expanded(flex: 1, child: _cabecera()),
          Expanded(flex: 9, child: _cuerpo())
        ],
      ),
    );
  }

  Widget _cabecera(){
    return Container(
      alignment: Alignment.center,
      color: Colors.indigo,
      child: Text("ULTIMAS NOTICIAS", style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),),
    );
  }


  Widget _cuerpo(){
    return FutureBuilder(future: miProvider.listaPeliculas(), builder: (context, snapshot) {
      if(snapshot.hasError){
        print(snapshot.error);
        return Text("No se cargaron los datos");
      }
      if(snapshot.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator());
      }

      var listaPeliculas = snapshot.data!;

      return ListView.separated(itemBuilder: (context, index) {
        var pelicula = listaPeliculas[index];
          if(pelicula.numstars == null){
             return _sinEstrella(pelicula);
             
          }
          else{
           return _conEstrella(pelicula);
          }
           
          

      },itemCount: listaPeliculas.length,
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(7.5),
        child: Container(
          child: Divider(
            
            color: Colors.amber,
            height: 1,
            thickness: 3,
           
            
            ),
        ),
      ),);
    },);
  }


  Widget _sinEstrella(ModelPelicula pelicula){
   
   return Row( 
    
    spacing: 15,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        flex: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5,top: 5),
              child: Text(pelicula.titulo, style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold),),
            ),
            FadeInImage.assetNetwork(placeholder: "assets/imaxes/loading.gif",placeholderCacheHeight: 200, image: pelicula.foto,
            
            alignment: Alignment.topLeft,)
          ],
        ),
      ),
      Expanded(
        flex: 2,
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
         spacing: 15,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(pelicula.desc!),
            ),
            Text("Comentarios: ${pelicula.comentarios}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)
          ],
        ),
      ),
      
    ],
   );
  }

  Widget _conEstrella(ModelPelicula pelicula){
    return Container(
      color: Colors.indigo,
      child: ListTile( 
        contentPadding: EdgeInsets.symmetric(horizontal: 15),
        leading:CircleAvatar( backgroundImage: NetworkImage(pelicula.foto),),
      title: Text( pelicula.titulo, style: TextStyle(color: Colors.white),),
      subtitle: AnimatedRatingStars(onChanged: (unnamed) {
        
      }, initialRating: pelicula.numstars!.toDouble(), starSize: 13, maxRating: 5, filledColor: Colors.yellow, customEmptyIcon: Icons.star_border_outlined,customHalfFilledIcon: Icons.star_half,customFilledIcon: Icons.star,),),
    );
  }
}