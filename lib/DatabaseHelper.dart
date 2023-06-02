// import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'package:flutter/widgets.dart';
// class DatabaseHelper {
//   static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
//   static Database? _database;
//
//   DatabaseHelper._privateConstructor();
//
//   Future<Database> get database async {
//     if (_database != null) {
//       return _database!;
//     }
//     _database = await _initDatabase();
//     return _database!;
//   }
//
//   Future<Database> _initDatabase() async {
//     String path = join(await getDatabasesPath(), 'smart_quran.db');
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: _createDatabase,
//     );
//   }
//
//   Future<void> _createDatabase(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE IF NOT EXISTS users (
//         username TEXT PRIMARY KEY AUTOINCREMENT,
//         email TEXT,
//         phoneNumber TEXT,
//         age INTEGER,
//         password TEXT
//       )
//     ''');
//   }
//
//   Future<int> insertUser(MyUser user) async {
//     Database db = await instance.database;
//     return await db.insert('users', user.toMap());
//   }
//
//   Future<List<MyUser>> getUsers() async {
//     Database db = await instance.database;
//     List<Map<String, dynamic>> maps = await db.query('users');
//     return List.generate(maps.length, (index) {
//       return MyUser.fromMap(maps[index]);
//     });
//   }
//
//   Future<MyUser?> getUser(String email, String password) async {
//     Database db = await instance.database;
//     List<Map<String, dynamic>> maps = await db.query(
//       'users',
//       where: 'email = ? AND password = ?',
//       whereArgs: [email, password],
//     );
//     if (maps.isNotEmpty) {
//       return MyUser.fromMap(maps.first);
//     }
//     return null;
//   }
// }


// WidgetsFlutterBinding.ensureInitialized();
//
// final database = openDatabase(
//   // Set the path to the database. Note: Using the `join` function from the
//   // `path` package is best practice to ensure the path is correctly
//   // constructed for each platform.
//     join(await getDatabasesPath(), 'users_database.db'),
// );
// class MyUser {
//   final String username;
//   final String email;
//   final String phoneNumber;
//   final int age;
//   final String password;
//
//   const MyUser({
//     required this.username,
//     required this.email,
//     required this.phoneNumber,
//     required this.age,
//     required this.password,
//   });
//
//   Map<String, dynamic> toMap() {
//     return {
//       'username': username,
//       'email': email,
//       'phoneNumber': phoneNumber,
//       'age': age,
//       'password': password,
//     };
//   }
//
//   factory MyUser.fromMap(Map<String, dynamic> map) {
//     return MyUser(
//       username: map['username'],
//       email: map['email'],
//       phoneNumber: map['phoneNumber'],
//       age: map['age'],
//       password: map['password'],
//     );
//   }
// }
