import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class TaskManager {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String date;
  @HiveField(2)
  final String priority;

  TaskManager({
    required this.title,
    required this.date,
    required this.priority,
  });
}
