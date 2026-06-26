import 'package:barras_progreso/providers/mis_provider.dart';
import 'package:barras_progreso/providers/porcentaje_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BarrasWidget extends StatelessWidget {
const BarrasWidget({ super.key });

  @override
  Widget build(BuildContext context){
    final miProvider = Provider.of<PorcentajeProvider>(context,listen: false);
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              miProvider.seleccionar(1);
            },
            child: Consumer<PorcentajeProvider>(builder: (context, provider, child) => 
               Container(  
               alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: provider.getSeleccionado==1 ?  Border.all(style: BorderStyle.solid) :  Border.all(style: BorderStyle.none),
                  borderRadius: BorderRadius.circular(20),
                 color: Colors.grey),
                height: 20,
                width: 200,
                
                child: _BarraInterior(indice: 1,),
              ),
            ),
          ),
          SizedBox(height: 10,),
          GestureDetector(
            onTap: () {
              miProvider.seleccionar(2);
            },
            child: Consumer<PorcentajeProvider>(builder: (context, provider, child) => 
               Container(
                alignment: Alignment.centerLeft,
                height: 20,
                width: 200,
                decoration: BoxDecoration(
                  border: provider.getSeleccionado==2 ? Border.all(style: BorderStyle.solid) : Border.all(style: BorderStyle.none),
                  borderRadius: BorderRadius.circular(20),
                color: Colors.grey),
                child: _BarraInterior(indice: 2)
              ),
            ),
          )
        ],
      ),
    );
  }

  
}

class _BarraInterior  extends StatelessWidget {
    final int indice;
    const _BarraInterior({ super.key , required this.indice});

  @override
  Widget build(BuildContext context){
    final miProvider = Provider.of<PorcentajeProvider>(context,listen: false);
    int valor = indice==1 ? miProvider.getPor1 : miProvider.getPor2;
    return Consumer(builder: (context,PorcentajeProvider provider, child) => 
                 Container(
                  alignment: Alignment.center,
                  width: valor.toDouble()*2,
                  height: 20,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                  color: Colors.green),
                  
                  child: Text("${valor}%"),
                ),
              );
  }
}