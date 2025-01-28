import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mytasks/models/model.dart';

ValueNotifier<List<TaskManager>> valueNotifier = ValueNotifier([]);

final dbName = 'taskDB';

Future<void> addTask(TaskManager data) async {
  final db = await Hive.openBox<TaskManager>(dbName);
  final id = await db.add(data);
  data.title;
  valueNotifier.value.add(data);
  await getData();
  valueNotifier.notifyListeners();
}

Future<void> getData() async {
  final db = await Hive.openBox<TaskManager>(dbName);
  valueNotifier.value.clear();
  valueNotifier.value.addAll(db.values);
  valueNotifier.notifyListeners();
}

Future<void> editTask(int index, TaskManager data) async {
  final db = await Hive.openBox<TaskManager>(dbName);
  db.putAt(index, data);
  getData();
}

Future<void> deleteTask(int index) async {
  final db = await Hive.openBox<TaskManager>(dbName);
  db.deleteAt(index);
  getData();
}
