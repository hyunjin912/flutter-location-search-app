import 'package:flutter/material.dart';
import 'package:flutter_loaction_search_app/core/geolocator_helper.dart';
import 'package:flutter_loaction_search_app/ui/home/home_view_model.dart';
import 'package:flutter_loaction_search_app/ui/home/widgets/home_list_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  TextEditingController textController = TextEditingController();

  late final vm = ref.read(homeViewModelProvider.notifier);

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HomeState homeState = ref.watch(homeViewModelProvider);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.pink[50],
        appBar: AppBar(
          backgroundColor: Colors.pink[50],
          title: TextField(
            onSubmitted: (value) {
              vm.search(textController.text);
            },
            controller: textController,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              hintText: '지역 이름을 검색해 주세요',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(),
              ),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () async {
                final pos = await GeolocatorHelper.getPosition();

                if (pos != null) {
                  vm.getLatLng(lat: pos.latitude, lng: pos.longitude);
                }
              },
              child: Container(
                width: 50,
                height: 50,
                color: Colors.transparent,
                child: Icon(Icons.gps_fixed),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 16, left: 16, right: 16),
          child: ListView.separated(
            itemCount: homeState.places.length,
            itemBuilder: (context, index) {
              return HomeListView(place: homeState.places[index]);
            },
            separatorBuilder: (context, index) => SizedBox(height: 20),
          ),
        ),
      ),
    );
  }
}
