import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:crypto/crypto.dart';


class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  static const _tableName = 'tasks';

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('users2.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    try {
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, fileName);

      return await openDatabase(path, version: 1, onCreate: _createDB);
    } catch (e) {
      throw Exception('Faild to initialize database: $e');
    }
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL
      )
    ''');
  }

  String hashPassword(String password) {
    return sha256.convert(utf8.encode(password)).toString();
  }

  Future<int> registerUser(String name, String email, String password) async {
    final db = await database;

    try {
      final hashedPassword = hashPassword(password);
      return await db.insert(
        'users',
        {
          'name': name,
          'email': email,
          'password': hashedPassword,
        },
        conflictAlgorithm: ConflictAlgorithm.abort,
      );
    } catch (e) {
      return -1; // Indicate failure, e.g., duplicate email
    }
  }

  Future<bool> loginUser(String email, String password) async {
    //final db = await DatabaseHelper.instance.database;
    final db = await database;

    final hashedPassword = hashPassword(password);

    final user = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, hashedPassword],
    );

    return user.isNotEmpty;
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> userMaps = await db.query('users'); // Zapytanie do tabeli "users"

    // Debugowanie: wypisz dane użytkowników
    for (var user in userMaps) {
      print('ID: ${user['id']}, Name: ${user['name']}, Email: ${user['email']}, Password: ${user['password']}');
    }

    return userMaps; // Zwraca listę map z użytkownikami
  }


  Future close() async {
    final db = await _database;
    if (db != null) {
      await db.close();
      _database = null;
    }
  }

}