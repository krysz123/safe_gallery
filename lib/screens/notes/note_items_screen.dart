import 'package:flutter/material.dart';
import 'package:safe_gallery/screens/notes/boxes.dart';

import 'note.dart';

class NoteItemsScreen extends StatefulWidget {
  const NoteItemsScreen({super.key});

  @override
  State<NoteItemsScreen> createState() => _NoteItemsScreenState();
}

class _NoteItemsScreenState extends State<NoteItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notatki'),
      ),
      body: ListView.builder(
        itemCount: boxNotes.length,
        itemBuilder: (context, index) {
          Note note = boxNotes.getAt(index);
          Note testPath = boxNotes.get('path');
          String titlePath = testPath.title;
          if (note.title != titlePath) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                child: ListTile(
                  leading: IconButton(
                    onPressed: () {
                      setState(() {
                        boxNotes.deleteAt(index);
                        boxNotes.delete(index);
                      });
                    },
                    icon: const Icon(
                      Icons.remove_circle,
                    ),
                  ),
                  title: Text(
                    note.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    note.content,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ),
            );
          }
          return null;
        },
      ),
    );
  }
}
