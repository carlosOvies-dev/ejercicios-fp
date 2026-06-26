class ServicesNoticia {

  final JSON=
[
      {
        'texto' : 'La Fiscalía amenaza el silencio en torno a la pareja de Ayuso con la solicitud de imputar a su fiscalista',
        'url' : 'https://static.eldiario.es/clip/3950af81-d5d2-4547-86bd-682f95d8fda8_16-9-discover-aspect-ratio_default_0.webp',
	'autor' : 'Pedro Águeda'
      },
    {
    'texto' : 'La Fiscalía denuncia nueve casos de supuesto abandono a ancianos muertos en residencias de Madrid en pandemia',
    'url' : 'https://static.eldiario.es/clip/c5362f8a-ad70-4321-85f6-b84c1129b2fc_16-9-discover-aspect-ratio_default_0.webp',
    'autor' : 'Alberto Pozas'
    },
    {
    'texto' : 'Un ex jerarca venezolano declara ante el juez que la brigada política del PP le entregó “fichas policiales” de Podemos',
    'url' : 'https://static.eldiario.es/clip/5c1dc779-07f1-4cb6-b172-2d4d893ea9a5_16-9-discover-aspect-ratio_default_0.webp',
    'autor' : 'Pedro Águeda'
    },
    {
    'texto' : 'El CIS mantiene la ventaja de cinco puntos del PSOE sobre el PP y recoge una caída de Vox',
    'url' : 'nova4.JPG',  // Gardada localmente
    'autor' : 'Marcos Pinheiro / Raúl Sánchez'
    },
];
  Future<List<Map<String,dynamic>>> miJson() async{
    return Future.delayed(Duration(seconds: 1),() => JSON);
  }
}

final miServices = ServicesNoticia();