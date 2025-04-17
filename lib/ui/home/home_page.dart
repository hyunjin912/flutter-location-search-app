import 'package:flutter/material.dart';
import 'package:flutter_loaction_search_app/ui/home/home_list_view.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.pink[50],
        appBar: AppBar(
          backgroundColor: Colors.pink[50],
          title: TextField(
            decoration: InputDecoration(
              hintText: '지역 이름을 검색해 주세요',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 16, left: 16, right: 16),
          child: ListView.separated(
            itemCount: 10,
            itemBuilder: (context, index) => HomeListView(),
            separatorBuilder: (context, index) => SizedBox(height: 20),
          ),
        ),
      ),
    );
  }
}
