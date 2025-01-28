import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:mytasks/models/model.dart';

class AddProvider extends ChangeNotifier {
  final Box<TaskManager> taskBox = Hive.box<TaskManager>('tasks');
  List<TaskManager> get tasks => taskBox.values.toList();

  final TextEditingController dateController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  // DateTime date = DateTime(1900);
  Future<void> pickedDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      dateController.text = formattedDate;

      notifyListeners();
    }
  }
}

// class Addprovider extends ChangeNotifier{
//   final TextEditingController textController = TextEditingController();
  
// }
