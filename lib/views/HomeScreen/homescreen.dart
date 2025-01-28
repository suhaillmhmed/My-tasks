import 'package:flutter/material.dart';
import 'package:mytasks/controllers/functions.dart';
import 'package:mytasks/models/model.dart';
import 'package:mytasks/views/AddScreen/addscreen.dart';
import 'package:mytasks/views/EditScreen/editscreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool isChecked = false;
  String? selectedpriorit;
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[2],
      appBar: AppBar(
        backgroundColor: Colors.amber[600],
        title: const Center(
            child: Text('My Tasks',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w600))),
      ),
      body: ValueListenableBuilder(
          valueListenable: valueNotifier,
          builder: (context, value, child) {
            print('${value.length}');

            return ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  final task = value[index];
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: _getCardColor(),
                          border: Border.all(
                              // color: _getbcolor(),
                              ),
                          borderRadius: BorderRadius.circular(25)),
                      child: ListTile(
                        leading: IconButton(
                          onPressed: () {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                          icon: Icon(
                            isChecked
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                          ),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 9.5),
                          child: Text(
                            task.title,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 25,
                                decoration: isChecked
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                decorationThickness: 5),
                          ),
                        ),
                        trailing: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Editscreen(),
                                  ),
                                );
                              },
                              child: const Icon(Icons.edit),
                            ),
                            GestureDetector(
                              child: Icon(
                                Icons.delete,
                                color: const Color.fromARGB(255, 168, 5, 5),
                              ),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.amber,
                                      title: Column(
                                        children: [
                                          const Text(
                                            'Do you want to delete this?',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  'Delete',
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                              child: Text(
                                task.date,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    decoration: isChecked
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                    decorationThickness: 5),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2),
                              child: DropdownButtonFormField<String>(
                                style: const TextStyle(fontSize: 17),
                                dropdownColor: const Color(0xFFFFB300),
                                focusColor: _getdropDowncolor(),
                                hint: Padding(
                                  padding: EdgeInsets.only(left: 3.5),
                                  child: Text(
                                    task.priority,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                items: const [
                                  DropdownMenuItem(
                                      value: "Low",
                                      child: Text(
                                        'Low',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                  DropdownMenuItem(
                                      value: "Medium",
                                      child: Text(
                                        'Medium',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                  DropdownMenuItem(
                                      value: "High",
                                      child: Text(
                                        'High',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ],
                                // ].map((String priority) {
                                //   return DropdownMenuItem<String>(
                                //     value: priority,
                                //     child: Text(priority),
                                //   );
                                // }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedpriorit = newValue;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Addscreen(),
              ));
        },
      ),
    );
  }

  Color _getCardColor() {
    if (selectedpriorit == "Low") {
      return const Color.fromARGB(255, 125, 221, 128);
    } else if (selectedpriorit == "High") {
      return const Color.fromARGB(255, 218, 110, 102);
    } else if (selectedpriorit == "Medium") {
      return const Color.fromARGB(255, 230, 224, 117);
    } else {
      return const Color(0XFFFFB300);
    }
  }

  Color _getdropDowncolor() {
    if (selectedpriorit == "Low") {
      return const Color.fromARGB(255, 126, 224, 129);
    } else if (selectedpriorit == "High") {
      return const Color.fromARGB(255, 218, 110, 102);
    } else if (selectedpriorit == "Medium") {
      return const Color.fromARGB(255, 230, 224, 117);
    } else {
      return const Color(0XFFFFB300);
    }
  }

  // Color _getbcolor() {
  //   if (selectedpriorit == "Low") {
  //     return const Color.fromARGB(255, 0, 116, 4);
  //   } else if (selectedpriorit == "High") {
  //     return const Color.fromARGB(255, 169, 23, 13);
  //   } else if (selectedpriorit == "Medium") {
  //     return const Color.fromARGB(255, 196, 186, 7);
  //   } else {
  //     return const Color(0XFFFFB300);
  //   }
  // }
}
