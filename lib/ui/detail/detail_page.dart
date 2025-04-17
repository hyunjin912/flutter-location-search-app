import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class DetailPage extends StatelessWidget {
  String link;

  DetailPage({required this.link});

  @override
  Widget build(BuildContext context) {
    print('link: $link');
    print(link.contains('http'));
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(backgroundColor: Colors.pink[50]),
      body:
          link.contains('http')
              ? InAppWebView(
                initialSettings: InAppWebViewSettings(
                  mediaPlaybackRequiresUserGesture: true,
                  javaScriptEnabled: true,
                  userAgent:
                      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36',
                ),
                initialUrlRequest: URLRequest(url: WebUri(link)),
              )
              : Center(
                child: Text(
                  'Not Found',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
    );
  }
}
