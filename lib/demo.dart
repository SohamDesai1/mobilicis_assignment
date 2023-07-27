import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  List a = [];
  // print(data);
    const apiURL =
        "https://dev2be.oruphones.com/api/v1/global/assignment/getListings?page=1&limit=10";
    final res = await http.get(Uri.parse(apiURL));
    var data = json.decode(res.body);
    a = List<String>.from(data['listings'].map((e) => e['images'][0]['fullImage']));
  print(a);
  // for (var i = 0; i <= 5; i++) {
  //   a.add(data['listings'][i]["make"]);
  // }
  // print(a);
  // var i = 0;
  // while (data['listings'][i]["make"] == "Apple") {
  //   a.add(data['listings'][i]["model"]);
  // }
}
