
import 'package:flutter/material.dart';

import 'movie_list.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movies DB",
      home: MovieListView()
    );
  }
}
