import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';
import 'package:news_app/views/news.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebView extends StatelessWidget {
  final String url;
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  ArticleWebView({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Flutter"),
            Text(
              "News",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: url,
          onWebViewCreated: ((WebViewController controller) {
            _completer.complete(controller);
          }),
        ),
      ),
    );
  }
}

class CategoryWebView extends StatelessWidget {
  final String category;
  CategoryWebView({Key? key, required this.category}) : super(key: key);

  final controller = Get.put(CategoryNews());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Flutter"),
              Text(
                "News",
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
        ),
        body: Obx(() {
          return controller.loading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.only(top: 16),
                            child: ListView.builder(
                              itemCount: controller.news.length,
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return BlogTile(
                                    imageUrl: controller.news[index].imageUrl,
                                    title: controller.news[index].title,
                                    url: controller.news[index].url,
                                    desc: controller.news[index].desc);
                              },
                            ))
                      ],
                    ),
                  ),
                );
        }));
  }
}
