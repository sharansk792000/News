import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsapp/components/tab.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/articles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(tabs: [
              Tabwidget(inserText: 'Home', insertIcon: Icons.menu),
              Tabwidget(inserText: 'Favourites', insertIcon: Icons.favorite)
            ]),
          ),
          body: ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final news = articles[index];

              final description = news.description;
              final title = news.title;
              final publishedAt = news.publishedAt;
              final imageUrl = news.image;

              return ListTile(
                isThreeLine: true,
                leading: CircleAvatar(
                    child: Image.network(imageUrl ??
                        "https://www.haliburtonforest.com/wp-content/uploads/2017/08/placeholder-square.jpg")),
                title: Text(title),
                subtitle: Text(description ?? ""),
                trailing: Text(publishedAt),
              );
            },
          ),
        ));
  }

  Future<void> fetchUsers() async {
    print('fetchedusers called');
    const url =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=c4ae52a5bf8c495090d61e3c48658fd1';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['articles'] as List<dynamic>;

    final transformed = results.map((e) {
      return Article(
        title: e['title'],
        publishedAt: e['publishedAt'],
        description: e['description'],
        image: e['urlToImage'],
      );

      // publishedAt: e['publishedAt']);
    }).toList();
    setState(() {
      articles = transformed;
    });
    print('fetchedusers completed');
  }
}
