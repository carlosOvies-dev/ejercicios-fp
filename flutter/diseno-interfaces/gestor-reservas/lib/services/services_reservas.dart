class ServicesReservas {

  final datos = [
    {
      "tipo": "hotel",
      "nombre": "Gran Hotel del Mar",
      "ubicacion": "Barcelona, España",
      "rating": "4.8",
      "imagenUrl":
          "https://voyadubai.com/wp-content/uploads/2024/10/Donde-alojarse-en-Dubai.jpg",
      "servicios": [
        "Wi-Fi",
        "Piscina",
        "Gimnasio",
        "Parking Gratuíto",
        "Restaurante",
      ],
    },
    {
      "tipo": "vuelo",
      "origen": "Madrid (MAD)",
      "destino": "Berlín (BER)",
      "fecha": "2025-11-10",
      "estado": "Confirmado",
    },
    {
      "tipo": "hotel",
      "nombre": "Refugio Montañés",
      "ubicacion": "Pirineos, Huesca",
      "rating": "4.5",
      "imagenUrl":
          "https://hereyoutravel.com/wp-content/uploads/2025/05/hoteles-en-dubai-2-scaled.webp",
      "servicios": ["Chimenea", "Desayuno Incluído", "Senderismo"],
    },
    {
      "tipo": "vuelo",
      "origen": "Sevilla (SVQ)",
      "destino": "París (CDG)",
      "fecha": "2025-11-12",
      "estado": "Pendente",
    },
  ];
 Future<List<Map<String,dynamic>>> miJson() async{
  return Future.delayed(Duration(seconds: 2), () => datos);
 }
}

final miServices = ServicesReservas();