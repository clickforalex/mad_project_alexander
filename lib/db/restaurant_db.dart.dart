// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:mad_project_alexander/Model/Restaurants.dart';
// import 'dart:async';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// void main() async {
//   // Avoid errors caused by flutter upgrade.
//   // Importing 'package:flutter/widgets.dart' is required.
//   WidgetsFlutterBinding.ensureInitialized();
//   // Open the database and store the reference.
//   final Future<Database> database = openDatabase(
//     // Set the path to the database. Note: Using the 'join' function from the
//     // 'path' package is best practice to ensure the path is correctly
//     // constructed for each platform.
//     join(await getDatabasesPath(), 'doggie_database.db'),
//     // When the database is first created, create a table to store dogs.
//     onCreate: (db, version) {
//       return db.execute(
//         "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
//       );
//     },
//     // Set the version. This executes the onCreate function and provides a
//     // path to perform database upgrades and downgrades.
//     version: 1,
//   );
//   Future<void> insertRestaurant(Restaurant restaurant) async {
//     // Get a reference to the database.
//     final Database db = await database;
//     // Insert the Dog into the correct table – 'dogs'. Also specify the
//     // `conflictAlgorithm`. In this case if the same dog is inserted
//     // multiple times, it replaces the previous data.
//     await db.insert(
//       'restaurants',
//       restaurant.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }
// } //main

// //inserDog() //main
