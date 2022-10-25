import 'package:naqsh_client/src/model/auth/login/login_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseLogin {
  String tableName = 'login';
  String columnId = '_id';
  String columnD1 = 'D1';
  String columnName = 'NAME';
  String columnD2 = 'D2';
  String columnD3 = 'D3';
  String columnD4 = 'D4';
  String columnIdT = 'ID_T';

  static final DataBaseLogin _dataBaseLogin = DataBaseLogin.internal();

  factory DataBaseLogin() => _dataBaseLogin;

  static Database? _db;

  DataBaseLogin.internal();
  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();

    return _db!;
  }
  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'naqsh.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }
  void _onCreate(Database db, int newVersion) async {
    await db.execute(
      'CREATE TABLE $tableName('
      '$columnId INTEGER PRIMARY KEY,'
      '$columnD1 INTEGER,'
      '$columnD2 INTEGER,'
      '$columnD3 INTEGER,'
      '$columnD4 INTEGER,'
      '$columnName TEXT,'
      '$columnIdT TEXT'
      ')',
    );
  }
  Future<int> saveLogin(LoginModel item) async {
    var dbClient = await db;
    var result = await dbClient.insert(
      tableName,
      item.toJson(),
    );
    print(result);
    return result;
  }
  Future<List<LoginModel>> getLogin() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM $tableName');
    List<LoginModel> data = <LoginModel>[];
    for (int i = 0; i < list.length; i++) {
      LoginModel p = LoginModel(
        name: list[i]['NAME'],
        d1: list[i]["D1"]??0,
        d2: list[i]["D2"]??0,
        d3: list[i]["D3"]??0,
        d4: list[i]["D4"]??0,
        idT: list[i]["ID_T"]??"",
        jwt: list[i]["JWT"]??"",
        message: list[i]["message"]??"",
      );
      data.add(p);
    }
    return data;
  }
  Future<void> clear() async {
    var dbClient = await db;
    await dbClient.rawQuery('DELETE FROM $tableName');
  }
}
