import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'data.db'),
    onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE listat (id INTEGER PRIMARY KEY, email TEXT, password TEXT, name TEXT, description TEXT, type TEXT, numitems INTEGER, parent INTEGER)");
    },
    version: 1,
  );

// Insert data
  Future<void> insertData(Dog dog) async {
    final Database db = await database;
    await db.insert(
      'listat',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

// Read data
  Future<List<Dog>> getData() async {
// Get a reference to the database. final Database db = await database;
    final Database db = await database;
// Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('listat');
// Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Dog(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
      ); // Dog
    }); // List.generate
  }

// Update
  Future<void> updateData(Dog dog) async {
// Get a reference to the database.
    final db = await database;
// Update the given Dog. await db.update( 'dogs',
    await db.update(
      'listat',
      dog.toMap(),
// Ensure that the Dog has a matching id.
      where: "id= ?",
// Pass the Dog's id as a whereArg to prevent SQL injection. whereArgs: [dog.id],
    );
  }

// Delete
  Future<void> deleteData(int id) async {
// Get a reference to the database. final db = await database;
    final Database db = await database;
// Remove the Dog from the database.
    await db.delete(
      'listat',
// Use a where clause to delete a specific dog.
      where: "id= ?",
// Pass the Dog's id as a whereArg to prevent SQL injection. whereArgs: [id],
      whereArgs: [id],
    );
  }
}

class Dog {
  final int id;
  final String name;
  final int age;
  Dog({required this.id, required this.name, required this.age});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}
