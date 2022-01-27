import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:project2/home_screen.dart';
import 'package:project2/models/home_screen_model.dart';

List<HomeScreenmodel> list = [];
Future<List<HomeScreenmodel>> getApi() async {
  final response =
      await https.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  var data = jsonDecode(response.body.toString());
  print(data);
  if (response.statusCode == 200) {
    list.clear();
    for (Map i in data) {
      HomeScreenmodel homescreenmodel = HomeScreenmodel(
          albumId: i['albumId'],
          id: i['id'],
          title: i['title'],
          url: i['url'],
          thumbnailUrl: i['thumbnailUrl']);
      list.add(homescreenmodel);
    }
    return list;
  } else {
    return list;
  }
}
