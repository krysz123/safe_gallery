import 'dart:io';

import 'package:flutter/material.dart';
import 'package:safe_gallery/screens/image_preview_screen.dart';
import 'package:safe_gallery/screens/notes/boxes.dart';
import 'package:safe_gallery/screens/notes/note.dart';

class PicturesItemsScreen extends StatefulWidget {
  const PicturesItemsScreen({super.key});

  @override
  State<PicturesItemsScreen> createState() => _PicturesItemsScreenState();
}

class _PicturesItemsScreenState extends State<PicturesItemsScreen> {
  late Future<List<File>> _imageFiles;
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
    _imageFiles = _listJpgFiles(directoryPath);
  }

  Future<List<File>> _listJpgFiles(String directoryPath) async {
    final directory = Directory(directoryPath);
    final List<File> imageFiles = [];

    await for (var file in directory.list()) {
      if (file.path.endsWith('.jpg')) {
        imageFiles.add(File(file.path));
      }
    }

    return imageFiles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Zdjęcia')),
      body: FutureBuilder<List<File>>(
        future: _imageFiles,
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
                        builder: (ctx) => ImagePreviewScreen(
                          picture: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                  child: Image.file(
                    snapshot.data![index],
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('Brak zdjęć'));
          }
        },
      ),
    );
  }
}
