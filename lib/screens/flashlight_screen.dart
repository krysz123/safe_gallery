import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

class FlashlightScreen extends StatefulWidget {
  const FlashlightScreen({super.key});

  @override
  State<FlashlightScreen> createState() => _FlashlightScreenState();
}

class _FlashlightScreenState extends State<FlashlightScreen> {
  bool isClicked = false;
  final controller = TorchController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: !isClicked ? Colors.red : Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
                const Icon(
                  Icons.power_settings_new_sharp,
                  size: 100,
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          InkWell(
            onTap: () {
              setState(() {
                controller.toggle();
                isClicked = !isClicked;
              });
            },
            child: Container(
              width: 200,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                !isClicked ? 'włącz' : 'wyłącz',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
