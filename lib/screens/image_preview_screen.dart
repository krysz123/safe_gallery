import 'dart:io';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImagePreviewScreen extends StatefulWidget {
  File picture;
  ImagePreviewScreen({required this.picture, super.key});

  @override
  State<ImagePreviewScreen> createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {
  @override
  Widget build(BuildContext context) {
    var szerokosc = MediaQuery.of(context).size.width * 0.8;
    var wysokosc = MediaQuery.of(context).size.height * 0.8;

    return Scaffold(
      body: Column(
        children: [
          Image.file(
            widget.picture,
            width: szerokosc,
            height: wysokosc,
            // fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 100,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'cofnij',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    widget.picture.delete();
                    Navigator.pop(context);
                  });
                },
                child: Container(
                  width: 100,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'usuń',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
