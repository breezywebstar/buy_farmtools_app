import 'package:flutter/material.dart';

class ToolComponent extends StatelessWidget {
  final String toolName;
  final String toolPrice;
  final String imagePath;
  final color;
  void Function()? onPressed;

  ToolComponent(
      {required this.toolName,
      required this.toolPrice,
      required this.imagePath,
      required this.color,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: color[100], borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              imagePath,
              height: 65,
            ),
            Text(toolName),
            Container(
              decoration: BoxDecoration(
                  color: color[800], borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(5),
              child: Text(
                '₦' + toolPrice,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
