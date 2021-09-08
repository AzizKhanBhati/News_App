import 'package:news_app/models/category.dart';

class NewsApiConstant {
  static String newsApiUrl =
      'https://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=2c3981b9d233416d929dbe1592201af2';
}

class CategoryList {
  static List<CategoryModel> category = [
    CategoryModel(
        categoryName: "Business",
        imageUrl:
            "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80"),
    CategoryModel(
        categoryName: "Entertainment",
        imageUrl:
            "https://images.unsplash.com/photo-1499364615650-ec38552f4f34?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=966&q=80"),
    CategoryModel(
        categoryName: "General",
        imageUrl:
            "https://images.unsplash.com/photo-1494059980473-813e73ee784b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1049&q=80"),
    CategoryModel(
        categoryName: "Health",
        imageUrl:
            "https://images.unsplash.com/photo-1532938911079-1b06ac7ceec7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1189&q=80"),
    CategoryModel(
        categoryName: "Science",
        imageUrl:
            "https://images.unsplash.com/photo-1582560475093-ba66accbc424?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=362&q=80"),
    CategoryModel(
        categoryName: "Sports",
        imageUrl:
            "https://images.unsplash.com/photo-1587280501635-68a0e82cd5ff?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"),
    CategoryModel(
        categoryName: "Technology",
        imageUrl:
            "https://images.unsplash.com/photo-1518770660439-4636190af475?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"),
  ];
}
