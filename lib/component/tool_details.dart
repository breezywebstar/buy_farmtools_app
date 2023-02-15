import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/tool_models.dart';

class ToolDetails extends StatelessWidget {
  final String detailName;
  final String detailPrice;
  final String imageDetailPath;
  final String detailDescription;
  final color;
  void Function()? onPressed;

  ToolDetails(
      {required this.detailName,
      required this.detailPrice,
      required this.imageDetailPath,
      required this.detailDescription,
      required this.color,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: BoxDecoration(
      //color: color,
      //borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      height: 400,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                detailName,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                child: Icon(Icons.close),
                onTap: () => Navigator.of(context).pop(),
              )
            ],
          ),
          Image.asset(
            imageDetailPath,
            height: 100,
          ),
          Container(
            decoration: BoxDecoration(
                color: color[800], borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(5),
            child: Text(
              '₦' + detailPrice,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: color[50], borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(10),
            child: Text(
              detailDescription,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Spacer(),
          SafeArea(
            child: MaterialButton(
              color: Colors.black,
              onPressed: onPressed,
              child: Text(
                'Add to Cart',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
