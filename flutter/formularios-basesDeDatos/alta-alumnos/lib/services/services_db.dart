import 'package:alumnos/model/model_alumno.dart';
import 'package:alumnos/model/model_curso.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ServicesDb {
  static const String _nombreDB = "Curso 2026";
  static const int _numVersion = 1;
  ServicesDb._();
  static final ServicesDb miDB =ServicesDb._();

  Database? _db;

  Future<Database> get getDB async {
    if(_db == null){
      _db = await _initDB();
      return _db!;
    }
    return _db!;
  }
  
  Future<Database> _initDB() async {
    final ruta = join( await getDatabasesPath(),_nombreDB);

    return openDatabase(ruta,
    onCreate: _crearDB,
    version: _numVersion,
    onUpgrade: (db, oldVersion, newVersion)async {
      await db.execute('DROP TABLE cursos');
      await db.execute('DROP TABLE alumnos');
      await _crearDB(db, newVersion);
    },);
  }
  
  Future<void> _crearDB(Database db, int version) async {
    await db.execute('''CREATE TABLE Cursos (
                      id INTEGER PRIMARY KEY AUTOINCREMENT,
                      nombre TEXT NOT NULL
                  );''');

    await db.execute(''' CREATE TABLE Alumnos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Nif TEXT NOT NULL,
    nombre TEXT NOT NULL,
    repetidor INTEGER NOT NULL,
    curso_id INTEGER NOT NULL,
    FOREIGN KEY (curso_id) REFERENCES Cursos (id)
    );''');

    ModelCurso c1= ModelCurso(nombre: "1º ESO");
    ModelCurso c2= ModelCurso(nombre: "2º ESO");
    ModelCurso c3= ModelCurso(nombre: "3º ESO");
    ModelCurso c4= ModelCurso(nombre: "4º ESO");

    await db.insert('cursos', c1.toMap());
    await db.insert('cursos', c2.toMap());
    await db.insert('cursos', c3.toMap());
    await db.insert('cursos', c4.toMap());      

    ModelAlumno a1= ModelAlumno(nif: "12345A", nombre: "Jose", repetidor: false, curso_id: 1);
    ModelAlumno a2= ModelAlumno(nif: "6789B", nombre: "Paco", repetidor: false, curso_id: 2);
    ModelAlumno a3= ModelAlumno(nif: "7412C", nombre: "Marta", repetidor: false, curso_id: 3);
    ModelAlumno a4= ModelAlumno(nif: "3698D", nombre: "Uxia", repetidor: true, curso_id: 4);        

    await db.insert('alumnos', a1.toMap());
    await db.insert('alumnos', a2.toMap());
    await db.insert('alumnos', a3.toMap());
    await db.insert('alumnos', a4.toMap());
    }

  Future<List<ModelCurso>> getCursos()async{
    final miDB= await getDB;
    final cursos = await miDB.query('cursos',orderBy: 'id');
    return cursos.map((e) => ModelCurso.fromMap(e),).toList();
  }  

  Future<List<ModelAlumno>> getALumnos(int id)async{
    final miDB = await getDB;
    final alumnos = await miDB.query('alumnos', where: 'curso_id=?', whereArgs: [id], orderBy: 'nombre');
    return alumnos.map((e) => ModelAlumno.fromMap(e),).toList();
  }

  Future<int> addAlumno (ModelAlumno alumno)async{
    final miDB = await getDB;
    int newID = await miDB.insert('alumnos', alumno.toMap());
    return newID;
  }
  Future<int> deleteAlumno(ModelAlumno alumno)async{
    final miDB = await getDB;
    int afectados = await miDB.delete('alumnos', where: 'id=?', whereArgs: [alumno.id]);
    return afectados;
  }
  Future<int> updateAlumno(ModelAlumno alumno)async{
    final miDB = await getDB;
    int afectados = await miDB.update('alumnos', alumno.toMap(), where: 'id=?', whereArgs: [alumno.id]);
    return afectados;
  }

  Future<String> getCurso(int id)async{
    final miDb = await getDB;
    final curso = await miDb.query('cursos', where: 'id=?', whereArgs: [id]);
    ModelCurso resultado = curso.map((e) => ModelCurso.fromMap(e),).first;
    return resultado.nombre;
  }

  void cerrarDb()async{
    if(_db!=null && _db!.isOpen){
      await _db!.close();
      _db=null;
    }
  }
}