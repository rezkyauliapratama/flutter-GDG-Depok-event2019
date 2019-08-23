
import 'package:flutter/material.dart';
import 'package:gdg_depok_2019_beginner/presenter/detailmovie/detail_movie.dart';

import 'movielist/movie_list.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movies DB",
      onGenerateRoute: routes,
    );
  }

  Route routes(RouteSettings setting) {
    print("routes: ${setting.name}");
    if (setting.name == '/') {
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return MovieListView();
        },
      );
    } else {
       return MaterialPageRoute(
        builder: (BuildContext context) {
          final movieId = int.parse(setting.name.replaceFirst('/', ''));
          return DetailMovieView(movieId);
        },
      );
    }
  }
}
