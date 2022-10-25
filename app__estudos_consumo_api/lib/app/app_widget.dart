import 'package:app_consumo_api/app/views/ghibli/ghibli_page.dart';
import 'package:app_consumo_api/app/views/home_page.dart';
import 'package:app_consumo_api/app/views/jsonplaceholder/jsonph_list.dart';
import 'package:app_consumo_api/app/views/jsonplaceholder/jsonph_photos_page.dart';
import 'package:app_consumo_api/app/views/jsonplaceholder/jsonph_posts_page.dart';
import 'package:app_consumo_api/app/views/jsonplaceholder/jsonph_todos_page.dart';
import 'package:app_consumo_api/app/views/jsonplaceholder/jsonph_users_page.dart';
import 'package:app_consumo_api/app/views/openweather/openweather_page.dart';

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/jsonlist': (context) => const JsonphList(),
        '/jsontodos': (context) => const JsonPlaceholderTodos(),
        '/jsonposts': (context) => const JsonPlaceholderPosts(),
        '/jsonphotos': (context) => const JsonPlaceholderPhotos(),
        '/jsonusers': (context) => const JsonPlaceholderUsers(),
        '/openweather': (context) => const OpenWeather(),
        '/ghibliapi': (context) => const GhibliPage(),
      },
    );
  }
}
