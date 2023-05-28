import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String homeUrl = 'https://youtube.com';
  WebViewController? _webViewController;
  @override
  void initState() {
    _webViewController = WebViewController()
      ..loadRequest(Uri.parse(homeUrl))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    super.initState();
  }

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
                if (_webViewController == null) {
                  return;
                }
                _webViewController!.loadRequest(Uri.parse(homeUrl));
              },
              icon: const Icon(Icons.home))
        ],
      ),
      body: SafeArea(
          bottom: false, child: WebViewWidget(controller: _webViewController!)),
    );
  }
}
