import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AutomovelWebview extends StatefulWidget {
  const AutomovelWebview({super.key});

  @override
  State<AutomovelWebview> createState() => _AutomovelWebviewState();
}

class _AutomovelWebviewState extends State<AutomovelWebview> {
  static const String _url = 'https://www.flutter.dev';
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()..loadRequest(Uri.parse(_url));

    if (!kIsWeb) {
      _controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          _url,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
        ],
      ),
    );
  }
}
