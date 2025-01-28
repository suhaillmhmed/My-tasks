import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mytasks/controllers/proider/add_provider.dart';
import 'package:mytasks/models/model.dart';
import 'package:provider/provider.dart';

class Addscreen extends StatefulWidget {
  const Addscreen({super.key});

  @override
  State<Addscreen> createState() => _AddscreenState();
}

class _AddscreenState extends State<Addscreen> {
  TextEditingController TitleController = TextEditingController();
  TextEditingController DateController = TextEditingController();
  String? selectedpriority;
  bool isclicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[2],
      appBar: AppBar(
        backgroundColor: Colors.amber[600],
        title: const Padding(
          padding: EdgeInsets.only(left: 95),
          child: Text('Add Your Task',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w600)),
        ),
      ),
      body: Consumer<AddProvider>(
        builder: (context, addprvdr, child) => ListView(
          children: [
            const SizedBox(
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: TitleController,
                decoration: const InputDecoration(
                    labelText: 'Add Task',
                    hintText: 'Task',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: DateController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Due Date',
                  hintText: 'Date',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2025),
                    lastDate: DateTime(2030),
                  );
                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    setState(() {
                      DateController.text = formattedDate;
                    });
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 9.5,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  style: TextStyle(fontSize: 17),
                  dropdownColor: Colors.amber,
                  hint: Text("Select Priority"),
                  items: const [
                    DropdownMenuItem(value: "Low", child: Text("Low")),
                    DropdownMenuItem(value: "Medium", child: Text("Medium")),
                    DropdownMenuItem(value: "High", child: Text("High")),
                  ],
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedpriority = newValue;
                    });
                  },
                ),
              ),
            ),
            //     ].map((String priority) {
            //       isclicked = false;
            //       return DropdownMenuItem<String>(
            //         value: priority,
            //         child: Text(priority),
            //       );
            //     }).toList(),
            //     onChanged: (String? newValue) {},
            //   ),
            // ),
            ElevatedButton(
                onPressed: () {
                  if (TitleController.text.isEmpty ||
                      DateController.text.isEmpty ||
                      selectedpriority == null) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('please fill all fields')));
                    return;
                  }
                  Navigator.pop(context);
                  final data = TaskManager(
                    title: TitleController.text,
                    date: DateController.text,
                    priority: selectedpriority.toString(),
                  );

                  print(data.title);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                child: const Text('Submit'))
          ],
        ),
      ),
    );
  }
}

extension on AddProvider {
  pickdate(BuildContext context) {}
}
