import 'package:sqflite/sqflite.dart';
import 'package:eval/data_base/database_connection.dart';

class UserRepository {
  late DatabaseConnection databaseConnection;

  UserRepository() {
    databaseConnection = DatabaseConnection();
  }

  static Database? _database;

  String table = "users";

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await databaseConnection.setDatabase();
      return _database;
    }
  }

  Future<int?> insertData(Map<String, dynamic> data) async {
    var connection = await database;
    return await connection?.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>?> readData() async {
    var connection = await database;
    return await connection?.query(table);
  }

  Future<List<Map<String, dynamic>>?> readDataById(int id) async {
    var connection = await database;
    return await connection?.query(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<int?> updateData(Map<String, dynamic> data) async {
    var connection = await database;
    return await connection?.update(table, data, where: 'id = ?', whereArgs: [data['id']]);
  }
}
