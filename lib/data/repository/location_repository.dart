import 'package:dio/dio.dart';
import 'package:flutter_loaction_search_app/data/model/location_model.dart';

class LocationRepository {
  final Dio _client = Dio(
    BaseOptions(
      // 설정 안 하면, 실패 응답 올 때 throw 던져서 에러 발생
      validateStatus: (status) => true,
      headers: {
        'X-Naver-Client-Id': 'NMPhvQCPL0eTHF0tINgB',
        'X-Naver-Client-Secret': 'HtBLoalFc6',
      },
    ),
  );

  Future<List<Location>> search(String query) async {
    try {
      final response = await _client.get(
        'https://openapi.naver.com/v1/search/local.json',
        queryParameters: {'query': query, 'display': 5},
      );

      if (response.statusCode == 200) {
        final items = List.from(response.data['items']);
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
