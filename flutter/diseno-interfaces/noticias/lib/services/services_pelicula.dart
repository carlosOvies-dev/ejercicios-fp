class ServicesPelicula {
    final datos = [
      {
        'titulo' : 'Analisis',
        'desc' : '¿Era inevitable? Breve historia de la guerra de Rusia en Ucrania',
        'foto' : 'https://static.eldiario.es/clip/28c9aa6b-25da-4a4a-b342-adeefeddae82_16-9-aspect-ratio_default_0_x5007y2652.jpg',
        'comentarios' : '28'
      },
      {
        'titulo' : 'La isla de Gran Canaria sigue en pie',
        'foto' : 'https://image.tmdb.org/t/p/w500/sGMA6pA2D6X0gun49igJT3piHs3.jpg',
        'numstars' : '2',
      },
      {
        'titulo' : 'En primera persona',
        'desc' : 'Kiev parece sacado de una película postapocalíptica, pero aún tenemos esperanza',
        'foto' : 'https://static.eldiario.es/clip/e72b735b-8c14-4bc5-a2ff-1c41114e91b1_16-9-aspect-ratio_default_0.jpg',
        'comentarios' : '13'
      },
      {
        'titulo' : '¿Las heridas de la COVID-19 han abierto camino a los cambios que esperábamos?',
        'foto' : 'https://image.tmdb.org/t/p/w500/sGMA6pA2D6X0gun49igJT3piHs3.jpg',
        'numstars' : '4',
      },
      {
        'titulo' : 'La isla de Gran Canaria sigue en pie',
        'foto' : 'https://image.tmdb.org/t/p/w500/sGMA6pA2D6X0gun49igJT3piHs3.jpg',
        'numstars' : '2',
      },
      {
        'titulo' : 'Última hora',
        'desc' : 'Rusia y Ucrania negocian ininterrumpidamente en formato de vídeo',
        'foto' : 'https://static.eldiario.es/clip/e72b735b-8c14-4bc5-a2ff-1c41114e91b1_16-9-aspect-ratio_default_0.jpg',
        'comentarios' : '87'
      },
      {
        'titulo' : 'Última hora',
        'desc' : 'El yodo de la farmacia no te salvaría de una catástrofe nuclear: comprarlo es inútil y peligros',
        'foto' : 'https://static.eldiario.es/clip/b7e33a90-20e7-41a2-840c-fc3df9ffecc1_16-9-discover-aspect-ratio_default_0.jpg',
        'comentarios' : '21'
      },
    ];

    Future<List<Map<String,dynamic>>> miJson() async{
      return Future.delayed(Duration(seconds: 1),() => datos);
    }    
}

final miServices =ServicesPelicula();