import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/constants/constants.dart';
import 'package:news_app/models/articles.dart';

class Controller extends GetxController {
  var loading = true.obs;

  var news = <ArticleModel>[].obs;

  void changeStatus() {
    if (news.isNotEmpty) {
      print("not empty");
      loading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getNews();
  }

  Future<void> getNews() async {
    var client = http.Client();
    var response = await client.get(Uri.parse(NewsApiConstant.newsApiUrl));
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel article = ArticleModel(
            title: element['title'],
            desc: element['description'],
            url: element['url'],
            imageUrl: element['urlToImage'],
          );
          news.add(article);
          changeStatus();
        }
      });
    }
  }
}

class CategoryNews extends GetxController {
  var loading = true.obs;

  var news = <ArticleModel>[].obs;

  void changeStatus() {
    if (news.isNotEmpty) {
      print("not empty");
      loading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getNews('business');
  }

  Future<void> getNews(String category) async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=2c3981b9d233416d929dbe1592201af2';
    var client = http.Client();
    var response = await client.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      await jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel article = ArticleModel(
            title: element['title'],
            desc: element['description'],
            url: element['url'],
            imageUrl: element['urlToImage'],
          );
          news.add(article);
          changeStatus();
        }
      });
    }
  }
}
