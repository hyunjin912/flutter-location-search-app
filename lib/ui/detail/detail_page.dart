import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class DetailPage extends StatefulWidget {
  String link;

  DetailPage({required this.link});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isLoaded = false;
  InAppWebViewController? webViewController;

  void onLoaded() {
    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.link.contains('http')) {
      return Scaffold(
        backgroundColor: Colors.pink[50],
        appBar: AppBar(backgroundColor: Colors.pink[50]),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: InAppWebView(
                initialSettings: InAppWebViewSettings(
                  mediaPlaybackRequiresUserGesture: true,
                  javaScriptEnabled: true,
                  userAgent:
                      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36',
                ),
                initialUrlRequest: URLRequest(url: WebUri(widget.link)),
                onLoadStop: (controller, url) {
                  print('웹페이지 로딩 완료!');
                  onLoaded();
                },
                onWebViewCreated: (controller) {
                  webViewController = controller;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () async {
                      if (await webViewController?.canGoBack() ?? false) {
                        webViewController?.goBack();
                      }
                    },
                    child: Container(
                      width: 30,
                      height: 50,
                      color: Colors.transparent,
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () async {
                      if (await webViewController?.canGoForward() ?? false) {
                        webViewController?.goForward();
                      }
                    },
                    child: Container(
                      width: 30,
                      height: 50,
                      color: Colors.transparent,
                      child: Icon(Icons.arrow_forward),
                    ),
                  ),
                ],
              ),
            ),
            isLoaded
                ? SizedBox()
                : Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    // width: double.infinity,
                    // height: double.infinity,
                    color: Colors.pink[50],
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
          ],
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.pink[50],
        appBar: AppBar(backgroundColor: Colors.pink[50]),
        body: Center(
          child: Text(
            'Not Found',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
  }
}
