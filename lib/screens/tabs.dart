import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:safe_gallery/screens/camera_screen.dart';
import 'package:safe_gallery/screens/files_screen.dart';
import 'package:safe_gallery/screens/flashlight_screen.dart';
import 'package:safe_gallery/screens/notes/notes_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const FilesScreen();

    if (_selectedPageIndex == 1) {
      activePage = const CameraScreen();
    } else if (_selectedPageIndex == 2) {
      activePage = const NotesScreen();
    } else if (_selectedPageIndex == 3) {
      activePage = const FlashlightScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.topRight,
          child: Text(
            'safe gallery',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: activePage,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: GNav(
          color: Colors.grey,
          activeColor: Colors.black,
          tabBackgroundColor: Colors.grey.shade500,
          gap: 5,
          padding: const EdgeInsets.all(16),
          onTabChange: _selectPage,
          tabs: const [
            GButton(
              icon: Icons.folder_open_outlined,
              text: 'Pliki',
            ),
            GButton(
              icon: Icons.camera_alt_outlined,
              text: 'Aparat',
            ),
            GButton(
              icon: Icons.edit_outlined,
              text: 'Notatki',
            ),
            GButton(
              icon: Icons.flashlight_on_outlined,
              text: 'Latarka',
            )
          ],
        ),
      ),
    );
  }
}
