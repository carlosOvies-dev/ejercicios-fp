class ServicesAventura {
  final datos = [
  {
    "titulo": "Caminata por el bosque nublado",
    "descripcion": "Explora senderos altos entre la niebla con vistas a valles verdes.",
    "duracion": 4,
    "imagen": "https://thumbs.dreamstime.com/b/un-grupo-de-excursionistas-caminando-por-bosque-nublado-al-amanecer-con-la-luz-del-sol-filtr%C3%A1ndose-trav%C3%A9s-los-%C3%A1rboles-creando-387222243.jpg",
    "rating": 3
  },
  {
    "titulo": "Kayak por el manglar",
    "descripcion": "Remar entre túneles de manglar en zonas protegidas del litoral.",
    "duracion": 3,
    "imagen": "https://ecotourism-world.com/wp-content/uploads/2021/07/filip-mroz-zK049OFP4uI-unsplash-1-1.jpg",
    "rating": 5
  },
  {
    "titulo": "Subida al volcán activo",
    "descripcion": "Una aventura intensa para ver crateres y flujos de lava recientes.",
    "duracion": 6,
    "imagen": "https://uecluster.blob.core.windows.net/images/planetainteligente/1572431122_volcan1400.jpg",
    "rating": 2
  },
  {
    "titulo": "Observación de ballenas",
    "descripcion": "Salida marítima al amanecer para avistar ballenas jorobadas en libertad.",
    "duracion": 5,
    "imagen": "https://www.ternua.com/wp/es/wp-content/uploads/2024/11/Alice-ballenas.jpg",
    "rating": 4
  },
  {
    "titulo": "Ciclismo entre viñedos orgánicos",
    "descripcion": "Ruta relajada en bicicleta entre viñedos ecológicos y bodegas sostenibles.",
    "duracion": 2,
    "imagen": "https://www.lavanguardia.com/files/og_thumbnail/uploads/2023/05/16/6463510ee7542.png",
    "rating": null
  },
  {
    "titulo": "Campamento ecológico junto al lago",
    "descripcion": "Dormida bajo las estrellas y aprendizaje sobre fauna nocturna.",
    "duracion": 1,
    "imagen": "https://www.conmishijos.com/assets/posts/15000/15331-campamentos-multiaventura-para-ninos.jpg",
    "rating": 1
  },
  {
    "titulo": "Snorkel en arrecife coralino",
    "descripcion": "Sumérgete en aguas cristalinas y observa corales y peces tropicales.",
    "duracion": 3,
    "imagen": "https://images.myguide-cdn.com/tenerife/companies/south-tenerife-guided-snorkeling/large/south-tenerife-guided-snorkeling-1468391.jpg",
    "rating": 4
  },
  {
    "titulo": "Trekking glaciar polar",
    "descripcion": "Camina sobre hielo azul milenario y explora cuevas glaciares.",
    "duracion": 7,
    "imagen": "https://media.tacdn.com/media/attractions-splice-spp-674x446/0f/e3/d2/8c.jpg",
    "rating": null
  },
  {
    "titulo": "Safari fotográfico en sabana africana",
    "descripcion": "Captura grandes mamíferos y aves en su ambiente natural.",
    "duracion": 5,
    "imagen": "https://infoturlatam.com/wp-content/uploads/2024/05/safari-orlando.jpg",
    "rating": 2
  },
  {
    "titulo": "Escalada en entornos de roca viva",
    "descripcion": "Ascenso a paredes de granito y vistas panorámicas de altura.",
    "duracion": 4,
    "imagen": "https://biosferaventura.es/wp-content/uploads/2021/05/climbing-gd6746a80c_1920.jpg",
    "rating": 5
  }
];

Future<List<Map<String,dynamic>>> miJson() async{
  return Future.delayed(Duration(seconds: 2), () => datos);
}
}

final miService = ServicesAventura();