import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/controller/controller.dart';
import 'package:news_app/views/webview.dart';

class News extends StatelessWidget {
  final homeNewsController = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
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
          return homeNewsController.loading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        /// category list view
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(right: 14, top: 8),
                          height: 70,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: CategoryList.category.length,
                            itemBuilder: (context, index) {
                              return CategoryTile(
                                categoryName:
                                    CategoryList.category[index].categoryName,
                                imageUrl: CategoryList.category[index].imageUrl,
                              );
                            },
                          ),
                        ),

                        /// article list view
                        Container(
                          padding: EdgeInsets.only(top: 16),
                          child: ListView.builder(
                            itemCount: homeNewsController.news.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return BlogTile(
                                  imageUrl:
                                      homeNewsController.news[index].imageUrl,
                                  title: homeNewsController.news[index].title,
                                  url: homeNewsController.news[index].url,
                                  desc: homeNewsController.news[index].desc);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                );
        }));
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName;

  const CategoryTile({Key? key, this.imageUrl, this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => CategoryWebView(category: categoryName.toLowerCase()));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, url;

  const BlogTile(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.url,
      required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ArticleWebView(url: url));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(imageUrl)),
            Text(
              title,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87),
            ),
            Text(
              desc,
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
