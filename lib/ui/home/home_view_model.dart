import 'package:flutter_loaction_search_app/data/location_model.dart';
import 'package:flutter_loaction_search_app/data/location_repository.dart';
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
}

// 3. 뷰모델 관리자 만들기
final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});
