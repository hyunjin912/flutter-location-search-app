import 'package:flutter_loaction_search_app/data/model/location_model.dart';
import 'package:flutter_loaction_search_app/data/repository/location_repository.dart';
import 'package:flutter_loaction_search_app/data/repository/vworld_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 상태 만들기
class HomeState {
  List<Location> places;

  HomeState({required this.places});
}

// 2. 뷰모델 만들기
class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    return HomeState(places: []);
  }

  Future<void> search(String query) async {
    LocationRepository locationRepo = LocationRepository();
    state = HomeState(places: await locationRepo.search(query));
  }

  Future<void> getLatLng({required double lat, required double lng}) async {
    VworldRepository vworldRep = VworldRepository();

    // 126.72575 37.3568615 시뮬레이터로 하는 것이므로 강제로 내 위치 할당
    final query = await vworldRep.findByLatLng(lat: 37.3568615, lng: 126.72575);
    await search(query);
  }
}

// 3. 뷰모델 관리자 만들기
final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});
