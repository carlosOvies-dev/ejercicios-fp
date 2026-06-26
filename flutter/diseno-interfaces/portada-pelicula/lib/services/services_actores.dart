class ServicesActores {
  final datos = 
  [
      {
        'name' : 'Tom Hardy',
        'url' : 'https://image.tmdb.org/t/p/w500/sGMA6pA2D6X0gun49igJT3piHs3.jpg'
      },
    {
    'name' : 'Woody Harrelson',
    'url' : 'https://image.tmdb.org/t/p/w500/igxYDQBbTEdAqaJxaW6ffqswmUU.jpg'
    },
    {
    'name' : 'Michelle Williams',
    'url' : 'https://image.tmdb.org/t/p/w500/sXTP6wlqIDz1tDGLU3DFbklSTpq.jpg'
    },
    {
    'name' : 'Naomie Harris',
    'url' : 'https://image.tmdb.org/t/p/w500/pDFs4gSeKSyIF8PditvtHqAq687.jpg'
    },
    {
    'name' : 'Reid Scott',
    'url' : 'https://image.tmdb.org/t/p/w500/kBAeDUDA7XJRXFLGNALlpE5d3lA.jpg'
    },
      {
        'name' : 'Tom Hardy',
        'url' : 'https://image.tmdb.org/t/p/w500/sGMA6pA2D6X0gun49igJT3piHs3.jpg'
      },
      {
        'name' : 'Woody Harrelson',
        'url' : 'https://image.tmdb.org/t/p/w500/igxYDQBbTEdAqaJxaW6ffqswmUU.jpg'
      },
      {
        'name' : 'Michelle Williams',
        'url' : 'https://image.tmdb.org/t/p/w500/sXTP6wlqIDz1tDGLU3DFbklSTpq.jpg'
      },
      {
        'name' : 'Naomie Harris',
        'url' : 'https://image.tmdb.org/t/p/w500/pDFs4gSeKSyIF8PditvtHqAq687.jpg'
      },
      {
        'name' : 'Reid Scott',
        'url' : 'https://image.tmdb.org/t/p/w500/kBAeDUDA7XJRXFLGNALlpE5d3lA.jpg'
      },
];
  Future<List<Map<String,dynamic>>> miJson () async{
    return Future.delayed(Duration(seconds: 2), () => datos);
  }
}

final miServices = ServicesActores();