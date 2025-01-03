import 'package:flutter/material.dart';
import 'package:safe_gallery/screens/films_items_screen.dart';
import 'package:safe_gallery/screens/notes/note_items_screen.dart';
import 'package:safe_gallery/screens/pictures_items_screen.dart';
import 'package:safe_gallery/widgets/files_category.dart';

class FilesScreen extends StatefulWidget {
  const FilesScreen({super.key});

  @override
  State<FilesScreen> createState() => _FilesScreenState();
}

class _FilesScreenState extends State<FilesScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FilesCategory(
            icon: const Icon(
              Icons.folder,
              size: 50,
            ),
            title: const Text(
              'Zdjęcia',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            destination: PicturesItemsScreen(),
          ),
          FilesCategory(
            icon: const Icon(
              Icons.video_camera_back_rounded,
              size: 50,
            ),
            title: const Text(
              'Filmy',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            destination: FilmsItemsScreen(),
          ),
          FilesCategory(
            icon: const Icon(
              Icons.note_sharp,
              size: 50,
            ),
            title: const Text(
              'Notatki',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            destination: const NoteItemsScreen(),
          ),
        ],
      ),
    );
  }
}
