import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

final homeUrl = Uri.parse('https://youtube.com');

class HomeScreen extends StatelessWidget {
  final WebViewController _webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(homeUrl);

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Title"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                _webViewController.loadRequest(homeUrl);
              },
              icon: const Icon(Icons.home))
        ],
      ),
      body: SafeArea(
          bottom: false, child: WebViewWidget(controller: _webViewController)),
    );
  }
}
