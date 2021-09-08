import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/views/news.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        home: News(),
        theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.amber),
        ),
        debugShowCheckedModeBanner: false,
      );
}
