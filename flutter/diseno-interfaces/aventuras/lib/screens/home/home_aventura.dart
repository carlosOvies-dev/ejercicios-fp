import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:aventuras_exoticas/model/model_aventura.dart';
import 'package:aventuras_exoticas/providers/provider_aventura.dart';
import 'package:flutter/material.dart';

class HomeAventura extends StatelessWidget {
const HomeAventura({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
     
     
      body: Column(
        
        children: [
          
           Expanded(flex:1 , child: _buildHeader()), 
           Expanded(flex: 2,child: _ImagenBanner(),),
          Expanded(flex: 4, child: _buildAdventureList())
        ],
      ),
    );
  }

  Widget _buildHeader(){
    return Container(
      color: Colors.green,
      alignment: Alignment.center,
      child: Text("Aventuras Ecoloxicas", style: TextStyle(color: Colors.white, 
      fontWeight: FontWeight.bold,
      fontSize: 20),),
    );
  }

 Widget _ImagenBanner(){
  return ClipRRect(
    clipBehavior: Clip.hardEdge,
    borderRadius: 
    
    BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
  child: Image.asset("assets/image/aventuras.jpg", fit: BoxFit.cover, width: double.infinity,),);
 }

 Widget _buildAdventureList(){
  return FutureBuilder(
    
    future: miProviders.miLista(), builder: (context, snapshot) {
    if(snapshot.hasError){
      print(snapshot.error);
      return Text("No se cargaron los datos");
    }
    if(snapshot.connectionState == ConnectionState.waiting){
      return Center(child: CircularProgressIndicator());
    }

    var listaAventura = snapshot.data!;

    return ListView.builder( itemBuilder: (context, index) {
      var aventura = listaAventura[index];
      return _buildAventureCard(aventura);

    },itemCount: listaAventura.length,);
  },);
 }


  Widget _buildAventureCard(ModelAventura aventura) {
  return Card(
     margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    clipBehavior: Clip.hardEdge,
    shape: RoundedRectangleBorder( borderRadius: BorderRadiusGeometry.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
    child: Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         FadeInImage.assetNetwork ( placeholder:"assets/image/loadingNatu.gif", image: aventura.imagen),
         Text(aventura.titulo, style: TextStyle(color: Colors.green, fontSize: 18),),
         Text(aventura.descripcion, style: TextStyle(color: Colors.green, fontSize: 12),),
         Text.rich(TextSpan(children: [
          WidgetSpan(child: Icon(Icons.timelapse_sharp, color: Colors.green,size: 12,)),
          TextSpan(text: "Durecion: ${aventura.duracion.toString()} horas", style: TextStyle(fontSize: 10))
         ])),
        _buildRating(aventura)
      ],
    ),
  );
}

Widget _buildRating(ModelAventura aventura){
  return Row(
    children: [
      Text("Medios de comunicacion",style: TextStyle(fontSize: 12),),
      Spacer(),
      if(aventura.rating == null)
         Row(
          children: [
            Icon(Icons.star_border, color: Colors.grey, size: 16,),
            SizedBox(width: 4,),
            Text("Sin valorar", style: TextStyle(color: Colors.grey),)
          ],
         )
      else if(aventura.rating! > 2)
      AnimatedRatingStars(initialRating: aventura.rating!.toDouble(), onChanged: (unnamed) {
        
      }, customFilledIcon: Icons.star,
       customHalfFilledIcon: Icons.star_half, 
       customEmptyIcon: Icons.star_border,
       maxRating: 5,
       filledColor: Colors.green,
       emptyColor: Colors.grey,
       starSize: 14,)
  
       else
        Row(children: 
          List.generate(5, (index) {
            if(index < aventura.rating!){
              return Icon(Icons.star, color: Colors.green, size: 18,);
            }else{
              return Icon(Icons.star_border, color: Colors.grey,size: 16,);
            }
          },)
        ,)
    ],
  );
}
}

