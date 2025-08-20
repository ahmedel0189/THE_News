import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String url;

  const WebViewScreen({
    super.key,
    required this.url,
  });

  @override
  State<WebViewScreen> createState() =>
      _WebViewScreenState();
}

class _WebViewScreenState
    extends State<WebViewScreen> {
  late WebViewController _controller;
  bool isloading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setNavigationDelegate(
        NavigationDelegate(
          onWebResourceError: (error) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(
              SnackBar(
                content: Text(
                  'فشل تحميل الرابط: ${error.description}',
                ),
                backgroundColor: Colors.red,
                duration: const Duration(
                  seconds: 1,
                ),
                behavior:
                    SnackBarBehavior.floating,
              ),
            );
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('opening Link '),
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
