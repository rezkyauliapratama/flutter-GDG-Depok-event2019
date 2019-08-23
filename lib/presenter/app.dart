
import 'package:flutter/material.dart';

import 'movielist/movie_list.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movies DB",
      home: MovieListView()
    );
  }

  Route routes(RouteSettings setting) {
    if (setting.name == '/') {
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return MovieListView();
        },
      );
    }
  }
}
