import 'dart:convert';

import 'package:flutter_loaction_search_app/data/location_model.dart';
import 'package:http/http.dart';

class LocationRepository {
  Future<List<Location>?> search(String query) async {
    try {
      final client = Client();
      final result = await client.get(
        Uri.parse(
          'https://openapi.naver.com/v1/search/local.json?query=$query&display=5',
        ),
        headers: {
          'X-Naver-Client-Id': 'NMPhvQCPL0eTHF0tINgB',
          'X-Naver-Client-Secret': 'HtBLoalFc6',
        },
      );

      if (result.statusCode == 200) {
        final map = jsonDecode(result.body);
        final items = List.from(map['items']);
        final iterable = items.map((e) => Location.fromJson(e));
        final list = iterable.toList();
        return list;
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
