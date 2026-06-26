import 'package:examen2/provider/contador_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ContainerWidget extends StatelessWidget {
const ContainerWidget({ super.key });

  @override
  Widget build(BuildContext context){
    final miProvider = Provider.of<ContadorProvider>(listen: true,context);
    return Container(
      color: Colors.greenAccent ,
      width: miProvider.getTam,
      height: miProvider.getTam,
    );
  }
}