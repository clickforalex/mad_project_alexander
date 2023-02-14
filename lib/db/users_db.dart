import 'package:mad_project_alexander/Model/Users.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Database db;

class UserDatabase {
  static Database _database;
  final String table = 'users';
  final int version = 1;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    var dir = await getDatabasesPath();
    String path = join(dir, 'users.db');
    var database = openDatabase(
      path,
      version: version,
      onCreate: (Database db, int version) {
        db.execute(
            'CREATE TABLE $table(id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT, password TEXT, name TEXT, phoneNo TEXT)');
      },
    );
    return database;
  }

  Future<void> save(Users users) async {
    Database db = await database;
    await db.insert(table, users.toMap());
  }

  Future<void> update(Users users) async {
    Database db = await database;
    await db
        .update(table, users.toMap(), where: 'id = ?', whereArgs: [users.id]);
  }

  Future<void> select(Users users) async {
    Database db = await database;
    await db.execute(
      "SELECT phoneNo,email FROM $table WHERE phoneNo=?",
    );
  }

  Future<void> delete(Users users) async {
    Database db = await database;
    await db.delete(table, where: 'id = ?', whereArgs: [users.id]);
  }

  Future<List<Users>> getUsers() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(table);
    List<Users> usersList = List<Users>();
    for (var map in maps) {
      usersList.add(Users.fromMap(map));
    }
    return usersList;
  }

  Future<Users> getUser(String phone) async {
    Database db = await database;
    Users getuser = Users();
    List<Map<String, dynamic>> maps = await db.query(table);
    List<Users> usersList = List<Users>();
    for (var map in maps) {
      usersList.add(Users.fromMap(map));
    }
    for (int a = 0; a < usersList.length; a++) {
      Users user = usersList[a];
      if (user.phoneNo == phone) {
        getuser = usersList[a];
        print(user.phoneNo);
        return getuser;
      }
    }
  }

  Future<bool> loginCheck(String phone) async {
    Database db = await database;
    bool check = false;
    List<Map<String, dynamic>> maps = await db.query(table);
    List<Users> usersList = List<Users>();
    for (var map in maps) {
      usersList.add(Users.fromMap(map));
    }
    print("Checking for existing user");
    for (int a = 0; a < usersList.length; a++) {
      Users user = usersList[a];
      print(user.phoneNo);
      if (user.phoneNo == phone) {
        check = true;
        print(user.phoneNo);
      }
    }
    if (check == true) {
      return true;
    } else {
      return false;
    }
  }
}
