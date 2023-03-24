import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/term_and_conditions/screen/term_and_conditions_page.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum WebViewKLocalHTML {
  termAndConditions,
  privacyPolicy,
  disable,
}

class WebviewPage extends StatefulWidget {
  const WebviewPage({
    Key? key,
    required this.title,
    this.link,
    this.javascriptMode = JavascriptMode.disabled,
    this.webViewKLocalHTML = WebViewKLocalHTML.disable,
  }) : super(key: key);

  final String title;
  final String? link;
  final JavascriptMode javascriptMode;
  final WebViewKLocalHTML webViewKLocalHTML;

  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  double current = 0;
  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.darkGreyDark,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(widget.title, style: AppTextStyle.textMedium),
        actions: [
          IconButton(
            onPressed: () {
              if (widget.webViewKLocalHTML == WebViewKLocalHTML.disable) {
                _controller.reload();
              }
            },
            icon: const Icon(
              Icons.refresh,
              color: AppColors.darkGreyDark,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearProgressIndicator(
                color: current == 1.0 ? Colors.white : AppColors.primaryDark,
                backgroundColor: AppColors.lightGreyMedium,
                value: current,
                semanticsLabel: "Loading",
                minHeight: 2.0,
              ),
              Expanded(
                child: WebView(
                  initialUrl: widget.link ?? 'about:blank',
                  javascriptMode: widget.javascriptMode,
                  onWebViewCreated: (controller) async {
                    _controller = controller;
                    if (widget.webViewKLocalHTML ==
                        WebViewKLocalHTML.termAndConditions) {
                      _controller.loadHtmlString(localTermAndConditions);
                    }
                  },
                  onProgress: (value) {
                    setState(() {
                      current = value / 100;
                    });
                  },
                ),
              ),
            ],
          ),
          Visibility(
            visible: current == 1.0 ? false : true,
            child: Center(
              child: Text(
                "Loading...",
                style: AppTextStyle.textMedium
                    .copyWith(color: AppColors.lightGreyDark),
              ),
            ),
          )
        ],
      ),
    );
  }
}
