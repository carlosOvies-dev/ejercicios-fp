import 'package:camiones/model/model_asociacion.dart';
import 'package:camiones/model/model_camion.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ServicesDb {

  static String nombreDB= "Camiones";
  static int numVersion =1;
  ServicesDb._();
  static ServicesDb miDB = ServicesDb._();

  Database? _db;

  Future<Database> getDB() async{
    if(_db == null){
      _db = await _initDB();
      return _db!;
    }
    return _db!;
      }
      
  Future<Database> _initDB() async {
    final ruta = join(await getDatabasesPath(),nombreDB);

    return openDatabase(ruta,
    onCreate: _CrearDB,
    version: numVersion,
    onUpgrade: (db, oldVersion, newVersion) async {
      await db.execute('DROP TABLE camiones');
      await db.execute('DROP TABLE asociaciones');
      await _CrearDB(db,newVersion);
    },);
  }
  
  Future<void> _CrearDB(Database db, int newVersion) async {
    await db.execute('''CREATE TABLE asociaciones (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT     
    ); ''');

    await db.execute('''CREATE TABLE camiones (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    matricula TEXT,
    cv INTEGER,
    estado TEXT,
    alta_capacidad INTEGER, 
    asociacion_id INTEGER NOT NULL,
    FOREIGN KEY (asociacion_id) REFERENCES asociaciones (id)
    ); ''');

    ModelAsociacion aso1 = ModelAsociacion(nome: "MRW");
    ModelAsociacion aso2 = ModelAsociacion(nome: "SEUR");

    await db.insert('asociaciones', aso1.toMap());
    await db.insert('asociaciones', aso2.toMap());
  }

  Future<int> addCamion( ModelCamion camion) async{
    final miDB = await getDB();

    int nuevoID = await miDB.insert('camiones', camion.toMap());

    return nuevoID;
  }

  Future<int> borrarCamion(ModelCamion camion) async{
    final miDb = await getDB();
    int idEliminado = await miDb.delete('camiones',where: 'id = ?',whereArgs: [camion.id]);
    return idEliminado;
  }

  Future<void> cerrarDB()async{
    if(_db!=null && _db!.isOpen){
      await _db!.close();
      _db = null;
    }
  }

  Future<List<ModelAsociacion>> getAsociaciones() async{
    final miDB = await getDB();

    final datos = await miDB.query('asociaciones');

    return datos.map((e) => ModelAsociacion.fromMap(e),).toList();
  }

  Future<List<ModelCamion>> getCamiones(int id) async{
    final miDB = await getDB();

    final datos = await miDB.query('camiones', where: 'asociacion_id = ?', whereArgs: [id]);

    return datos.map((e) => ModelCamion.fromMap(e),).toList();
  }
}