import 'package:barras_progreso/providers/porcentaje_provider.dart';
import 'package:barras_progreso/widgets/barras_widget.dart';
import 'package:barras_progreso/widgets/circulo_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
const Home({ super.key });

  @override
  Widget build(BuildContext context){
    final miProvider = Provider.of<PorcentajeProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Control de Progreso'),
      ),
      body: Column(
        
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BarrasWidget(),
          CirculoWidget(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed:() {
                if(miProvider.getSeleccionado==1){
                  if(miProvider.getMod1 < 5){
                  miProvider.aumentarP1();
                  } else{
                    Navigator.of(context).pushNamed('pantalla1', arguments: {'barra':'1',
                                                                                  'porcentaje':'${miProvider.getPor1}'});
                  }
                }
                if(miProvider.getSeleccionado==2){
                  if(miProvider.getMod2 < 5){
                  miProvider.aumentarP2();
                  } else{
                    Navigator.of(context).pushNamed('pantalla1', arguments: {
                      'barra':'2',
                      'porcentaje': '${miProvider.getPor2}'
                    });
                  }
                }
              } , child: Icon(Icons.plus_one)),
              SizedBox(width: 20,),
              ElevatedButton(onPressed: () {
                if(miProvider.getSeleccionado==1){
                  if(miProvider.getMod1 < 5){
                  miProvider.restarP1(); 
                  } else{
                    Navigator.of(context).pushNamed('pantalla1',arguments: {
                      'barra':'1',
                      'porcentaje': '${miProvider.getPor1}'
                    });
                  }
                }
                if(miProvider.getSeleccionado==2){
                  if(miProvider.getMod2 < 5){
                  miProvider.restarP2();
                  }else{
                    Navigator.of(context).pushNamed('pantalla1', arguments: {
                      'barra':'2',
                      'porcentaje':'${miProvider.getPor2}'
                    });
                  }
                }
              }, child: Icon(Icons.remove))
            ],
          )

        ],
      ),
    );
  }
}