class ModelActores {
  final String name;
  final String url;

  const ModelActores({ required this.name, required this.url});

  factory ModelActores.fromjson(Map<String,dynamic> mapa){
    return ModelActores(name: mapa["name"], url: mapa["url"]);
  }
}