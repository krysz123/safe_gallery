import 'package:flutter/material.dart';
import 'dart:io';
import 'package:safe_gallery/screens/film_preview_screen.dart';
import 'package:safe_gallery/screens/notes/boxes.dart';
import 'package:safe_gallery/screens/notes/note.dart';

class FilmsItemsScreen extends StatefulWidget {
  const FilmsItemsScreen({super.key});

  @override
  State<FilmsItemsScreen> createState() => _FilmsItemsScreenState();
}

class _FilmsItemsScreenState extends State<FilmsItemsScreen> {
  late Future<List<File>> _filmFiles;
  late String directoryPath;

  @override
  void initState() {
    super.initState();
    _initializePathAndImages();
  }

  void _initializePathAndImages() {
    Note note = boxNotes.get('path');

    String pathNote = note.content;
    String test2 = pathNote;

    int lastIndex = test2.lastIndexOf('/');
    if (lastIndex != -1) {
      test2 = test2.substring(0, lastIndex + 1);
    }

    directoryPath = test2;
    _filmFiles = _listMp4Files(directoryPath);
  }

  Future<List<File>> _listMp4Files(String directoryPath) async {
    final directory = Directory(directoryPath);
    final List<File> filmFiles = [];

    await for (var file in directory.list()) {
      if (file.path.endsWith('.mp4')) {
        filmFiles.add(File(file.path));
      }
    }

    return filmFiles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filmy'),
      ),
      body: FutureBuilder<List<File>>(
        future: _filmFiles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Wystąpił błąd: ${snapshot.error}'));
          }

          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return GridView.builder(
              reverse: false,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => FilmPreviewScreen(
                            videoFile: snapshot.data![index],
                          ),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.video_call,
                      size: 50,
                    ));
              },
            );
          } else {
            return const Center(child: Text('Brak filmów'));
          }
        },
      ),
    );
  }
}
