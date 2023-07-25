// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class BrandCard extends StatelessWidget {
  String img;
  double width;
  double height;
  String text;

  BrandCard(
      {super.key,
      required this.img,
      required this.height,
      required this.width,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(img),
          ),
          text.isNotEmpty
              ? const SizedBox(
                  height: 10,
                )
              : const SizedBox(),
          text.isNotEmpty ? Center(child: Text(text)) : const SizedBox()
        ],
      ),
    );
  }
}
