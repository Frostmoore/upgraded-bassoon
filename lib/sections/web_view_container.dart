import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:agenzia_x/assets/constants.dart' as constants;

class WebViewContainer extends StatefulWidget {
  const WebViewContainer({super.key});

  @override
  State<WebViewContainer> createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.disabled)
    ..loadRequest(constants.URL_FORM_DENUNCIA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(constants.TITOLO_FORM_DENUNCIA),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
