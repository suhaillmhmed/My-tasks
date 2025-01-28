import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mytasks/controllers/proider/add_provider.dart';
import 'package:mytasks/models/model.dart';

import 'package:mytasks/views/HomeScreen/homescreen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  if (!Hive.isAdapterRegistered(TaskManagerAdapter().typeId)) {
    Hive.registerAdapter(TaskManagerAdapter());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AddProvider(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Homescreen(),
      ),
    );
  }
}
