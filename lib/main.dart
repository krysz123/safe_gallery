import 'package:flutter/material.dart';
import 'package:safe_gallery/screens/notes/note.dart';
import 'package:safe_gallery/screens/security_screen.dart';
import 'package:safe_gallery/screens/tabs.dart';
import 'package:torch_controller/torch_controller.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'screens/notes/boxes.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  boxNotes = await Hive.openBox<Note>('noteBox');

  TorchController().initialize();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SecurityScreen(),
      routes: {
        '/authenticated': (context) => const TabsScreen(),
      },
    );
  }
}
