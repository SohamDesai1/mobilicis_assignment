import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';
import 'package:mobilicis_assignment/widgets/brand_card.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(canvasColor: const Color.fromARGB(255, 236, 236, 236)),
    home: const MainApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<CarouselItem> items = [
    CarouselItem(image: const AssetImage('assets/images/carousel.png')),
    CarouselItem(image: const AssetImage('assets/images/carousel.png')),
    CarouselItem(image: const AssetImage('assets/images/carousel.png')),
    CarouselItem(image: const AssetImage('assets/images/carousel.png'))
  ];

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
                    child: Image.asset("assets/images/logo.png", height: 42),
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 98,
                  right: MediaQuery.of(context).size.width / 1.5,
                ),
                child: const Text("Buy Top Brands"),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 30),
                child: Row(
                  children: [
                    BrandCard(
                      img: 'assets/images/brands/apple.png',
                      height: 70,
                      width: 90,
                      text: "",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    BrandCard(
                      img: 'assets/images/brands/sam.png',
                      height: 70,
                      width: 90,
                      text: "",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    BrandCard(
                      img: 'assets/images/brands/mi.png',
                      height: 70,
                      width: 90,
                      text: "",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    BrandCard(
                      img: 'assets/images/brands/vivo.png',
                      height: 70,
                      width: 90,
                      text: "",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              CustomCarouselSlider(
                items: items,
                height: 250,
                selectedDotWidth: 20,
                unselectedDotWidth: 20,
                width: MediaQuery.of(context).size.width,
                autoplay: true,
                showText: false,
                showSubBackground: false,
                indicatorShape: BoxShape.rectangle,
                indicatorPosition: IndicatorPosition.bottom,
                selectedDotColor: Colors.black,
                unselectedDotColor: Colors.white,
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width / 1.3,
                    ),
                    child: const Text("Shop By"),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 30,
                    ),
                    child: Row(
                      children: [
                        BrandCard(
                          img: 'assets/images/first.png',
                          height: 120,
                          width: 90,
                          text: "Bestselling\n  Mobiles",
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        BrandCard(
                          img: 'assets/images/sec.png',
                          height: 120,
                          width: 90,
                          text: "Verified\nDevices Only",
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        BrandCard(
                          img: 'assets/images/tri.png',
                          height: 120,
                          width: 90,
                          text: "Like New\nCondition",
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        BrandCard(
                          img: 'assets/images/four.png',
                          height: 120,
                          width: 90,
                          text: "Phones with\nWarranty",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 30,
                ),
                child: Row(
                  children: [
                    const Text("Best Deals Near You"),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      "India",
                      style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.3,
                    ),
                    Row(
                      children: [
                        const Text("Sort"),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.sort))
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
