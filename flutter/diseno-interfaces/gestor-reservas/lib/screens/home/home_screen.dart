import 'package:flutter/material.dart';
import 'package:reservas/model/model_reservas.dart';
import 'package:reservas/providers/providers_reservas.dart';

class HomeScreen extends StatelessWidget {
const HomeScreen({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Xestor de Reservas'),
      ),
      body: FutureBuilder(future: miProviders.listaReservas(), builder: (context, snapshot) {
        if(snapshot.hasError){
          print(snapshot.error);
          return Text("Error al cargar fotos");
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
      
        var listaReservas = snapshot.data ?? [];
      
        return ListView.builder(itemBuilder: (context, index) {
          var reserva =listaReservas[index];
          if(reserva.tipo == "hotel"){
            return _hotel(reserva);
          }
         
          if(reserva.tipo == "vuelo"){
            return _vuelo(reserva);
          }else{
              return Text("No tiene tipo");

          }
                
        },itemCount: listaReservas.length,);
      },),
    );
  }

  Widget _hotel(ModelReservas reserva){
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.hardEdge,
      child: Column(
        
        children: [
          FadeInImage(placeholder: AssetImage("assets/images/cargando.gif"), 
          image: NetworkImage(reserva.imagen! ,),
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,),
          Container(
            padding: EdgeInsets.all(15),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Nombre hotel: ${reserva.nombre}",textAlign: TextAlign.start,),
                    Spacer(),
                    Text.rich(TextSpan(children: [
                      WidgetSpan(child: Icon(Icons.star_purple500,size: 15,)),
                      TextSpan( text: reserva.rating.toString()  )
                    ]))
                  ],
                ),
                Text(reserva.ubicacion.toString() ,style: TextStyle(color: Colors.grey),textAlign: TextAlign.left,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Divider(color: Colors.grey,height: 1,),
                ),
                Text("Servicios:"),
                SingleChildScrollView( 
                  
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: (reserva.servicios ?? []).map((unServicio) => _servicio(unServicio)).toList()

                    ,
                  ),
                )
              ],
            ) ,
          )

        ],
      ),
    );
  }

  Widget _servicio(String servicio){
    return Container(
      margin: EdgeInsets.only(right: 8),
    padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.circular(20)),
      child: Text(servicio,style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
    );
  }

  Widget _vuelo(ModelReservas reserva){
    return Card(
      child: ListTile(leading: Icon(Icons.flight_takeoff),
      title: Text("Destino: ${reserva.origen} -> ${reserva.destino} "),
      subtitle: Text(reserva.fecha.toString()),
      trailing: _estado(reserva),),
    );
  }

  Widget _estado(ModelReservas reserva){
    
    Color cor =Colors.black;
    if(reserva.estado == "Confirmado"){
       cor = Colors.green;
    }
    if(reserva.estado == "Pendente"){
      cor = Colors.orange;
    }
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(20)),
      
      child: Text(reserva.estado.toString()),
    );
  }
}