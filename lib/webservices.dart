import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_login_project/item_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkRequest {
  static String url = 'https://randomuser.me/api/?results=10';

  static List<ListItem> parseItem(String responseBody) {
    var list = jsonDecode(responseBody) as List<dynamic>;
    List<ListItem> listItems = list.map((e) => ListItem.fromJson(e)).toList();
    return listItems;
  }

  static Future<List<ListItem>> fetchItem() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // return parseItem(response.body);
      return compute(parseItem, response.body);
    } else {
      throw Exception('Can\'t get items');
    }
  }
}
