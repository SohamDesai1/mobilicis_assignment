import 'package:flutter/material.dart';
import 'package:mobilicis_assignment/widgets/brand_card.dart';

void main() {
  runApp(const MaterialApp(
    home: MainApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 29, 33, 68),
          toolbarHeight: 110,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                          size: 50,
                        )),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Image.asset("assets/logo.png", height: 42),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4.7,
                  ),
                  const Row(
                    children: [
                      Text(
                        "India",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Icon(
                        Icons.location_on_sharp,
                        size: 30,
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.notifications_none_sharp,
                    size: 40,
                  ),
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.02,
                height: MediaQuery.of(context).size.height / 25,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 26,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search with make and model.."),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        );
  }
}
