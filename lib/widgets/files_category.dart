import 'package:flutter/material.dart';

class FilesCategory extends StatelessWidget {
  final Icon icon;
  final Text title;
  final Widget destination;

  FilesCategory({
    required this.icon,
    required this.title,
    required this.destination,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var szerokosc = MediaQuery.of(context).size.width * 0.7;
    var wysokosc = MediaQuery.of(context).size.height * 0.20;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((ctx) => destination),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            width: szerokosc,
            height: wysokosc,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  icon,
                  const SizedBox(height: 10),
                  title,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
