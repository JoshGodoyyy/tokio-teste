import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AutomovelWebview extends StatefulWidget {
  final String url;
  const AutomovelWebview({super.key, required this.url});

  @override
  State<AutomovelWebview> createState() => _AutomovelWebviewState();
}

class _AutomovelWebviewState extends State<AutomovelWebview> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.url,
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
