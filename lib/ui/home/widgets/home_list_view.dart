import 'package:flutter/material.dart';
import 'package:flutter_loaction_search_app/data/model/location_model.dart';
import 'package:flutter_loaction_search_app/ui/detail/detail_page.dart';

// {
//   "title": "정왕본동행정복지센터",
//   "link":
//       "http://www.siheung.go.kr/city/main.do?method=mainView&siteCmsCd=CM0403",
//   "category": "공공,사회기관>행정복지센터",
//   "description": "",
//   "telephone": "",
//   "address": "경기도 시흥시 정왕동 2149-3",
//   "roadAddress": "경기도 시흥시 역전로 228 정왕본동주민센터",
//   "mapx": "1267460506",
//   "mapy": "373493011",
// }

class HomeListView extends StatelessWidget {
  Location place;

  HomeListView({required this.place});

  @override
  Widget build(BuildContext context) {
    RegExp regExp = RegExp(r'<[^>]+>');

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPage(link: place.link);
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 22),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey[500]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              place.title.replaceAll(regExp, ''),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(place.category, maxLines: 1, overflow: TextOverflow.ellipsis),
            Text(
              place.roadAddress,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
