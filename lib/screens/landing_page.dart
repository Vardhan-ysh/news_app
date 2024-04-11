import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/news_article.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPage extends StatefulWidget {
  LandingPage({required this.category, super.key});

  String category;

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<NewsArticle> news = [];

  bool isLoading = true;

  @override
  void initState() {
    getNews();
    super.initState();
  }

  Future<void> getNews() async {
    print('getNews called'); // Add this line
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=${widget.category}&apiKey=6385f71003f643d2a17431f98593e7ea";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach(
        (element) {
          if (element['urlToImage'] != null &&
              element['description'] != null &&
              element['title'] != null &&
              element['publishedAt'] != null &&
              element['author'] != null &&
              element['content'] != null &&
              element['url'] != null) {
            NewsArticle article = NewsArticle(
              author: element['author'],
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content'],
            );
            news.add(article);
            print(" ${element['title']} added to news list"); // Add this line
          }
        },
      );
    }
    setState(() {
      isLoading = false;
    });
    print('getNews completed'); // Add this line
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: news.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: SizedBox(
                        width: 100,
                        height: 100,
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/images/placeholder.jpg',
                          image: news[index].urlToImage!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(news[index].title!),
                      subtitle: Text(news[index].description!),
                      onTap: () async {
                        String url = news[index].url!;
                        try {
                          await launchUrl(
                            Uri.parse(url),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Could not open the article'),
                            ),
                          );
                        }
                      },
                    ),
                    const Divider(),
                  ],
                );
              },
            ),
    );
  }
}
