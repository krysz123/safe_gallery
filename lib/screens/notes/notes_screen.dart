import 'package:flutter/material.dart';
import 'package:safe_gallery/screens/notes/boxes.dart';
import 'package:safe_gallery/screens/notes/note.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    screenHeight = screenHeight * 0.5;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'tytuł...',
                    filled: true,
                    fillColor: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: screenHeight,
                  color: Colors.grey,
                  child: TextField(
                    controller: _contentController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'wpisz tekst...',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    setState(
                      () {
                        boxNotes.put(
                          'key_${_titleController.text}',
                          Note(
                            title: _titleController.text,
                            content: _contentController.text,
                          ),
                        );
                        _titleController.clear();
                        _contentController.clear();
                      },
                    );
                  },
                  child: Container(
                    width: 200,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'zapisz',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _contentController.dispose();
  }
}
