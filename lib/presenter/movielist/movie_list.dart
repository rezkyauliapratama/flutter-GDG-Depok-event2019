import 'package:flutter/material.dart';
import 'package:gdg_depok_2019_beginner/data/entity/movie_dto.dart';
import 'package:gdg_depok_2019_beginner/presenter/movielist/movie_list_bloc.dart';

class MovieListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie List"),
      ),
      body: BodyPage(),
    );
  }
}

/*
* Widget BodyPage
*/
class BodyPage extends StatefulWidget {
  MovieListBloc bloc = MovieListBloc();

  @override
  State<StatefulWidget> createState() {
    bloc.getMovies(1);
    return StateMovieList(bloc);
  }
}

class StateMovieList extends State<BodyPage> {
  MovieListBloc bloc;

  StateMovieList(this.bloc);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: bloc.movies,
          builder: (context, AsyncSnapshot<List<MovieDto>> snapshot) {
            if (snapshot.hasData) {
              print("snapshot : ${snapshot.data}");
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index){
                    MovieDto movie = snapshot.data[index];
                    return ListTile(
                      title: Text(movie.title),
                      subtitle: Text(movie.overview)
                    );
                  }
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
