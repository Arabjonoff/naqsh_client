import 'package:naqsh_client/src/model/auth/login/login_model.dart';
import 'package:naqsh_client/src/model/category/category_detail/category_detail_model.dart';
import 'package:naqsh_client/src/model/category/category_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseLogin {
  String _tableName = 'cart';
  String _columnId = 'ID';
  String _columnName = 'NAME';
  String _columnidSkl2 = 'ID_SKL2';
  String _columnidTip = 'ID_TIP';
  String _columnNarhi = 'NARHI';
  String _columnNarhiS = 'NARHI_S';
  String _columnSnarhi = 'SNARHI';
  String _columnSnarhis = 'SNARHI_S';
  String _columnOsno = 'OSONI';
  String _columnYil = 'YIL';
  String _columnOy = 'OY';
  String _columnidSkl0 = 'ID_SKL0';
  String _columnCount = 'count';

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
    await db.execute(
      'CREATE TABLE $_tableName('
      '$_columnId INTEGER PRIMARY KEY,'
      '$_columnName TEXT,'
      '$_columnidSkl2 INTEGER,'
      '$_columnidTip INTEGER,'
      '$_columnNarhi INTEGER,'
      '$_columnNarhiS INTEGER,'
      '$_columnSnarhi INTEGER,'
      '$_columnSnarhis INTEGER,'
      '$_columnOsno REAL,'
      '$_columnYil TEXT,'
      '$_columnOy TEXT,'
      '$_columnCount INTEGER,'
      '$_columnidSkl0 INTEGER'
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
        d1: list[i]["D1"] ?? 0,
        d2: list[i]["D2"] ?? 0,
        d3: list[i]["D3"] ?? 0,
        d4: list[i]["D4"] ?? 0,
        idT: list[i]["ID_T"] ?? "",
        jwt: list[i]["JWT"] ?? "",
        message: list[i]["message"] ?? "",
      );
      data.add(p);
    }
    return data;
  }

  Future<void> clear() async {
    var dbClient = await db;
    await dbClient.rawQuery('DELETE FROM $tableName');
  }



  /// Cart DataBase .....

  Future<int> saveProduct(ProductResult item) async {
    var dbClient = await db;
    var result = await dbClient.insert(
      _tableName,
      item.toJson(),
    );
    print(result);
    return result;
  }

  Future<int> updateProduct(ProductResult products) async {
    var dbClient = await db;
    return await dbClient.update(
      _tableName,
      where: "id = ?",
      products.toJson(),
      whereArgs: [products.id],
    );
  }

  Future<int> deleteProductCard(int id) async {
    var dbClient = await db;
    int result = await dbClient.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return result;
  }

  Future<List<ProductResult>> getProduct() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM $_tableName');
    List<ProductResult> data = <ProductResult>[];
    for (int i = 0; i < list.length; i++) {
      ProductResult p = ProductResult(
        id: list[i]["ID"] ?? 0,
        name: list[i]["NAME"] ?? "",
        idSkl2: list[i]["ID_SKL2"] ?? 0,
        idTip: list[i]["ID_TIP"] ?? 0,
        narhi: list[i]["NARHI"] ?? 0,
        narhiS: list[i]["NARHI_S"] ?? 0,
        snarhi: list[i]["SNARHI"] ?? 0,
        snarhiS: list[i]["SNARHI_S"] ?? 0,
        osoni: list[i]["OSONI"].toDouble() ?? 0.0,
        yil: list[i]["YIL"] ?? "",
        oy: list[i]["OY"] ?? "",
        idSkl0: list[i]["ID_SKL0"] ?? 0,
        count: list[i]["count"] ?? 0,
      );
      data.add(p);
    }
    return data;
  }

  Future<void> clearCart() async {
    var dbClient = await db;
    await dbClient.rawQuery('DELETE FROM $_tableName');
  }
}
