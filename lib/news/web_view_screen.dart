import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});
  static const String name = 'WebViewScreen';

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late Articles? article;
  late WebViewController controller;
  int loadingProgress = 0;

  @override
  Widget build(BuildContext context) {
    article = ModalRoute.of(context)!.settings.arguments as Articles;
    if (loadingProgress == 0) {
      webController();
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * .08,
        centerTitle: true,
        title: Text(
          article?.title ?? '',
          style: GoogleFonts.exo(
            textStyle: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          if (loadingProgress < 100)
            Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
                value: loadingProgress / 100.0,
              ),
            ),
        ],
      ),
    );
  }

  void webController() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            loadingProgress = progress;
            setState(() {});
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
         /* onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },*/
        ),
      )
      ..loadRequest(Uri.parse(article!.url ?? ''));
  }
}
