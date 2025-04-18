import 'package:dio/dio.dart';

// https://api.vworld.kr/req/data
// request=GetFeature
// key=E1B6D332-31BA-3941-A913-6E2BCD3D2E8E
// data=LT_C_ADEMD_INFO
// geomFilter=POINT(126.7240066 37.360311)
// geometry=false
// size=100

class VworldRepository {
  final Dio _client = Dio(
    BaseOptions(
      // 설정 안 하면, 실패 응답 올 때 throw 던져서 에러 발생
      validateStatus: (status) => true,
    ),
  );

  Future<String> findByLatLng({
    required double lat,
    required double lng,
  }) async {
    try {
      final response = await _client.get(
        'https://api.vworld.kr/req/data',
        queryParameters: {
          'request': 'GetFeature',
          'key': 'E1B6D332-31BA-3941-A913-6E2BCD3D2E8E',
          'data': 'LT_C_ADEMD_INFO',
          'geomFilter': 'POINT($lng $lat)',
          'geometry': false,
          'size': 100,
        },
      );
      if (response.statusCode == 200 &&
          response.data['response']['status'] == 'OK') {
        // response > result > featureCollection > features[0] > properties > emd_kor_nm
        return response
            .data['response']['result']['featureCollection']['features'][0]['properties']['emd_kor_nm'];
      }
      return '';
    } catch (e) {
      print(e);
      return '';
    }
  }
}
