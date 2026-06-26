import 'package:examen_piano/model/model_piano.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ServicesDb {

  static String _nombreDB = "Tienda";
  static int _numVersion =1;
  ServicesDb._();
  static ServicesDb miDB = ServicesDb._();

  Database? _db;

  Future<Database> getDB () async{
    if(_db == null){
      _db = await _initDB();
      return _db!;
    }
    return _db!;
  }
  
 Future<Database> _initDB() async{
    final ruta = join(await getDatabasesPath(),_nombreDB );

    return openDatabase(ruta,
    version: _numVersion,
    onCreate: _creadDB,
    onUpgrade: (db, oldVersion, newVersion) async {
      await db.execute('DROP TABLE piano');
      await _creadDB( db,  newVersion);
    },);

 }
 
  Future<void> _creadDB( Database db, int newVersion) async {
    await db.execute(''' CREATE TABLE "piano" (
"id" INTEGER,
"modelo" varchar(25) NOT NULL,
"ano_compra" INTEGER NOT NULL,
"novo" INTEGER NULL,
"prezo" NUMERIC(6,2) NOT NULL,
PRIMARY KEY("id"AUTOINCREMENT)
);''');
  }

  Future<void> cerrarDB() async{
    final miDB = await getDB();
    await miDB.close();
  }

  Future<int> addPiano(ModelPiano piano) async{
    final miDB = await getDB();

    final newId = await miDB.insert('piano', piano.toMap());

    return newId;
  }

  Future<int> borrarPiano(ModelPiano piano)async{
    final miDb = await getDB();

    final idBorrado = await miDb.delete('piano', where: 'id = ?',whereArgs: [piano.id]);

    return idBorrado;
  }

  Future<List<ModelPiano>> getPianos ()async{
    final miDb = await getDB();

    final lista = await miDb.query('piano', orderBy: 'modelo');

    return lista.map((e) => ModelPiano.fromMap(e),).toList();
  }
}