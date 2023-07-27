import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';
import 'package:mobilicis_assignment/widgets/brand_card.dart';
import 'package:mobilicis_assignment/widgets/product.dart';
import 'package:tuple/tuple.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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

  List<String> img = [];
  List<int> price = [];
  List<String> name = [];
  List<String> storage = [];
  List<String> cond = [];
  final TextEditingController _controller = TextEditingController();
  Map<String, String> selectedFilters = {};
  Map<String, List<String>> filters = {};

  @override
  void initState() {
    super.initState();
    _fetch();
    getFiltersFromApi();
  }

  Future<
      Tuple5<List<String>, List<int>, List<String>, List<String>,
          List<String>>> _fetch() async {
    const apiURL =
        "https://dev2be.oruphones.com/api/v1/global/assignment/getListings?page=2&limit=10";
    final res = await http.get(Uri.parse(apiURL));
    var data = json.decode(res.body);
    // var i = 0;
    name = List<String>.from(data['listings'].map((e) => e['model']));
    price = List<int>.from(data['listings'].map((e) => e['listingNumPrice']));
    storage =
        List<String>.from(data['listings'].map((e) => e['deviceStorage']));
    img = List<String>.from(
        data['listings'].map((e) => e['defaultImage']['fullImage']));
    cond = List<String>.from(data['listings'].map((e) => e['deviceCondition']));
    // print(name);
    // print(cond);
    // print(price);
    // print(img);
    // print(storage);
    return Tuple5<List<String>, List<int>, List<String>, List<String>,
        List<String>>(name, price, storage, img, cond);
  }

  Future<void> getFiltersFromApi() async {
    const apiURL =
        "https://dev2be.oruphones.com/api/v1/global/assignment/getFilters?isLimited=true";
    final res = await http.get(Uri.parse(apiURL));
    var data = json.decode(res.body);
    setState(() {
      filters = Map<String, List<String>>.from(data['filters']
          .map((key, value) => MapEntry(key, List<String>.from(value))));
    });
  }

  void _showFilterSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SingleChildScrollView(
            child: Column(
              children: filters.entries.map((entry) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(entry.key,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    Wrap(
                      children: entry.value.map((value) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: FilterChip(
                            label: Text(value),
                            selected: selectedFilters[entry.key] == value,
                            onSelected: (bool isSelected) {
                              setState(() {
                                if (isSelected) {
                                  selectedFilters[entry.key] = value;
                                } else {
                                  selectedFilters.remove(entry.key);
                                }
                              });
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                );
              }).toList(),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 29, 33, 68),
          toolbarHeight: MediaQuery.of(context).size.height / 7.8,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.menu,
                          size: MediaQuery.of(context).size.width / 10,
                        )),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Image.asset("assets/images/logo.png",
                        height: MediaQuery.of(context).size.height / 23),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4.7,
                  ),
                  Row(
                    children: [
                      const Text(
                        "India",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Icon(
                        Icons.location_on_sharp,
                        size: MediaQuery.of(context).size.width / 12,
                      ),
                    ],
                  ),
                  Icon(
                    Icons.notifications_none_sharp,
                    size: MediaQuery.of(context).size.width / 9.6,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 75,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.02,
                height: MediaQuery.of(context).size.height / 25,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: MediaQuery.of(context).size.width / 15,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 90,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.3,
                      // height: 400,
                      child: const TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search with make and model.."),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: FutureBuilder<
            Tuple5<List<String>, List<int>, List<String>, List<String>,
                List<String>>>(
          future: _fetch(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var name = snapshot.data!.item1;
              var price = snapshot.data!.item2;
              var storage = snapshot.data!.item3;
              var img = snapshot.data!.item4;
              var cond = snapshot.data!.item5;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 98,
                        right: MediaQuery.of(context).size.width / 1.5,
                      ),
                      child: const Text("Buy Top Brands"),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 60,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 30),
                      child: Row(
                        children: [
                          BrandCard(
                            img: 'assets/images/brands/apple.png',
                            height: MediaQuery.of(context).size.height / 12.5,
                            width: MediaQuery.of(context).size.width / 4.6,
                            text: "",
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 40,
                          ),
                          BrandCard(
                            img: 'assets/images/brands/sam.png',
                            height: MediaQuery.of(context).size.height / 12.5,
                            width: MediaQuery.of(context).size.width / 4.6,
                            text: "",
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 40,
                          ),
                          BrandCard(
                            img: 'assets/images/brands/mi.png',
                            height: MediaQuery.of(context).size.height / 12.5,
                            width: MediaQuery.of(context).size.width / 4.6,
                            text: "",
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 40,
                          ),
                          BrandCard(
                            img: 'assets/images/brands/vivo.png',
                            height: MediaQuery.of(context).size.height / 12.5,
                            width: MediaQuery.of(context).size.width / 4.6,
                            text: "",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 60,
                    ),
                    CustomCarouselSlider(
                      items: items,
                      height: MediaQuery.of(context).size.height / 3.5,
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
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 60,
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
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 60,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 30,
                          ),
                          child: Row(
                            children: [
                              BrandCard(
                                img: 'assets/images/first.png',
                                height:
                                    MediaQuery.of(context).size.height / 7.4,
                                width: MediaQuery.of(context).size.width / 4.6,
                                text: "Bestselling\n  Mobiles",
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 40,
                              ),
                              BrandCard(
                                img: 'assets/images/sec.png',
                                height:
                                    MediaQuery.of(context).size.height / 7.4,
                                width: MediaQuery.of(context).size.width / 4.6,
                                text: "Verified\nDevices Only",
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 40,
                              ),
                              BrandCard(
                                img: 'assets/images/tri.png',
                                height:
                                    MediaQuery.of(context).size.height / 7.4,
                                width: MediaQuery.of(context).size.width / 4.6,
                                text: "Like New\nCondition",
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 40,
                              ),
                              BrandCard(
                                img: 'assets/images/four.png',
                                height:
                                    MediaQuery.of(context).size.height / 7.4,
                                width: MediaQuery.of(context).size.width / 4.6,
                                text: "Phones with\nWarranty",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 40,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 30,
                      ),
                      child: Row(
                        children: [
                          const Text("Best Deals Near You"),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 70,
                          ),
                          const Text(
                            "India",
                            style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.8,
                          ),
                          InkWell(
                            onTap: _showFilterSheet,
                            child: Row(
                              children: [
                                const Text("Filter"),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 50,
                                ),
                                const Icon(Icons.sort)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 40,
                    ),
                    for (var j = 0; j < (name.length - 1) / 2; j++)
                      Row(
                        children: [
                          ProductCard(
                            img: img[j * 2],
                            name: name[j * 2],
                            price: price[j * 2],
                            storage: storage[j * 2],
                            cond: cond[j * 2],
                          ),
                          ProductCard(
                            img: img[j * 2 + 1],
                            name: name[j * 2 + 1],
                            price: price[j * 2 + 1],
                            storage: storage[j * 2 + 1],
                            cond: cond[j * 2 + 1],
                          ),
                        ],
                      ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
