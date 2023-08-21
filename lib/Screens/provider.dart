import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class NewsProvider with ChangeNotifier {
  String? stringResponse;
  Map? mapResponse;
  List listResponse = [];

  Future<void> fetchNews() async {
    http.Response response;
    String url =
        "https://newsapi.org/v2/everything?q=apple&from=2023-08-13&to=2023-08-13&sortBy=popularity&apiKey=c5edfc13379847838c965bd8d1374efc";
    response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      stringResponse = response.body;
      mapResponse = json.decode(response.body);
      listResponse = mapResponse!['articles'];
      notifyListeners();
    } else {
      print("error in loading");
    }
  }
}