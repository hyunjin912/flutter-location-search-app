import 'dart:convert';

import 'package:flutter_loaction_search_app/data/location_model.dart';
import 'package:http/http.dart';

class LocationRepository {
  Future<List<Location>> search(String query) async {
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

        // 여기서 List.from을 하지 않고
        // items = map('items'); 를 하면 items의 타입은 dynamic이 된다
        // List일게 분명한데도 말이다.
        // 그래서 List.from으로 복사를 하면 타입이 List<dynamic>이 된다
        // List<dynamic>이 돼야 final list의 타입이 List<Locaation>으로 제대로 된다
        final items = List.from(map['items']);

        final iterable = items.map((e) => Location.fromJson(e));
        final list = iterable.toList();

        return list;
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
