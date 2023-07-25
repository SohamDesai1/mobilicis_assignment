import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  List a = [];
  const apiURL =
      "https://dev2be.oruphones.com/api/v1/global/assignment/getListings?page=2&limit=10";
  final res = await http.get(Uri.parse(apiURL));
  var data = json.decode(res.body);
  // print(data['listings'][0]);
  // for (var i = 0; i <= 5; i++) {
  //   a.add(data['listings'][i]["make"]);
  // }
  // print(a);
  var i = 0;
  while (data['listings'][i]["make"]=="Apple") {
    a.add(data['listings'][i]["model"]);
  }
}
