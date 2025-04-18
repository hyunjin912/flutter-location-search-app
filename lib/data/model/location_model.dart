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
class Location {
  String title;
  String link;
  String category;
  String description;
  String telephone;
  String address;
  String roadAddress;
  String mapx;
  String mapy;

  Location({
    required this.title,
    required this.link,
    required this.category,
    required this.description,
    required this.telephone,
    required this.address,
    required this.roadAddress,
    required this.mapx,
    required this.mapy,
  });

  Location.fromJson(Map<String, dynamic> map)
    : this(
        title: map['title'],
        link: map['link'],
        category: map['category'],
        description: map['description'],
        telephone: map['telephone'],
        address: map['address'],
        roadAddress: map['roadAddress'],
        mapx: map['mapx'],
        mapy: map['mapy'],
      );

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "link": link,
      "category": category,
      "description": description,
      "telephone": telephone,
      "address": address,
      "roadAddress": roadAddress,
      "mapx": mapx,
      "mapy": mapy,
    };
  }
}
