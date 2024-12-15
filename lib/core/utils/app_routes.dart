import 'package:flutter/material.dart';
import 'package:notes_app/features/home/presentation/views/home_view.dart';
import 'package:notes_app/features/home/presentation/views/search_view.dart';

abstract class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
    HomeView.id: (context) => const HomeView(),
    SearchView.id: (context) => SearchView(),
  };
}
