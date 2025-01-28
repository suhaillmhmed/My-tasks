import 'package:flutter/material.dart';

class Editscreen extends StatelessWidget {
  const Editscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[3],
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Padding(
          padding: EdgeInsets.only(left: 95),
          child: Text('Edit Your Task',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w600)),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
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
                decoration: const InputDecoration(
                    labelText: 'Due Date',
                    hintText: 'Date',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white),
                onTap: () async {
                  DateTime date = DateTime(1900);
                  FocusScope.of(context).requestFocus(FocusNode());

                  date = await showDatePicker(
                      context: context,
                      initialDate: DateTime(1990),
                      firstDate: DateTime(1990),
                      lastDate: DateTime(2030)) as DateTime;
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 9.5,
            ),
            child: DropdownButton<String>(
              style: TextStyle(fontSize: 17),
              dropdownColor: Colors.amber,
              hint: Text("Select Priority"),
              items: [
                "Low",
                "Medium",
                "High",
              ].map((String priority) {
                return DropdownMenuItem<String>(
                  value: priority,
                  child: Text(priority),
                );
              }).toList(),
              onChanged: (String? newValue) {},
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
              child: Text('Submit'))
        ],
      ),
    );
  }
}
