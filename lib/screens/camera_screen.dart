import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_camera/flutter_camera.dart';
import 'package:safe_gallery/screens/notes/boxes.dart';
import 'package:safe_gallery/screens/notes/note.dart';
import 'package:safe_gallery/screens/tabs.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  void checkKey(path) {
    String key = 'path';

    if (!boxNotes.containsKey(key)) {
      setState(() {
        boxNotes.put(
          'path',
          Note(
            title: 'test',
            content: path,
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterCamera(
      iconColor: Colors.black,
      color: Colors.transparent,
      onImageCaptured: (value) {
        final path = value.path;
        checkKey(path);
        print("::::::::::::::::::::::::::::::::: $path");
        if (path.contains('.jpg')) {
          showDialog(
              barrierColor: Colors.white,
              context: context,
              builder: (context) {
                return Column(
                  children: [
                    AlertDialog(
                      content: Image.file(File(path)),
                    ),
                    FloatingActionButton(
                      child: const Text('zapisz'),
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const TabsScreen(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      },
                    )
                  ],
                );
              });
        }
      },
      onVideoRecorded: (value) {
        final path = value.path;
        checkKey(path);
        print('::::::::::::::::::::::::;; dkdkkd $path');
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const TabsScreen(),
          ),
          (Route<dynamic> route) => false,
        );
      },
    );
  }
}
