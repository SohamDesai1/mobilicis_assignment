import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  String img;
  int price;
  String name;
  String storage;
  String cond;

  ProductCard(
      {super.key,
      required this.img,
      required this.price,
      required this.name,
      required this.storage,
      required this.cond});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width / 2,
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width / 2.5),
            child: Icon(
              Icons.favorite_outline_outlined,
              color: Colors.red,
              size: MediaQuery.of(context).size.width / 15,
            ),
          ),
          Image.network(
            img,
            width: MediaQuery.of(context).size.width / 4.6,
            height: MediaQuery.of(context).size.height / 7.4,
          ),
          Center(
            child: Text(name),
          ),
          Text(cond),
          Text(price.toString())
        ],
      ),
    );
  }
}
