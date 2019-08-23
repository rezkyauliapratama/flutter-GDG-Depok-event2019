import 'package:flutter/material.dart';
import 'package:gdg_depok_2019_beginner/data/entity/movie_dto.dart';
import 'package:gdg_depok_2019_beginner/presenter/movielist/movie_list_bloc.dart';
import 'package:shimmer/shimmer.dart';

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
  final MovieListBloc bloc = MovieListBloc();

  @override
  State<StatefulWidget> createState() {
    bloc.getMovies(1);
    return StateMovieList(bloc);
  }
}

/*
1. State class
*/
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
                  itemBuilder: (context, index) {
                    MovieDto movie = snapshot.data[index];
                    return moviesListTile(context, movie);
                  });
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

  /*
  2. Widget to display item of movie
   */
  Widget moviesListTile(BuildContext context, MovieDto item) {

    //3. Array of widget to create the layout
    List<Widget> children = <Widget>[
      _backgroundPoster(item),
      Container(
        decoration: _buildGradientBackground(),
        padding: const EdgeInsets.only(
          bottom: 16.0,
          left: 16.0,
          right: 16.0,
        ),
        child: _buildTextualInfo(item),
      ),
    ];

    return GestureDetector(
      onTap: () {
        print("ontap");
        Navigator.pushNamed(context, "/${item.id}");
      },
      child: Card(
          child: Container(
        height: 200,
        child: Stack(
          fit: StackFit.expand,
          children: children,
        ),
      )),
    );
  }

  Widget _backgroundPoster(MovieDto item) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
            )),
        Image.network(
          "http://image.tmdb.org/t/p/w780/" + item.backdropPath,
          fit: BoxFit.cover,
        )
      ],
    );
  }

  Widget _buildTextualInfo(MovieDto movieCard) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          movieCard.title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          movieCard.voteAverage.toString(),
          style: const TextStyle(
            fontSize: 12.0,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

  BoxDecoration _buildGradientBackground() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        stops: <double>[0.0, 0.7, 0.7],
        colors: <Color>[
          Colors.black,
          Colors.transparent,
          Colors.transparent,
        ],
      ),
    );
  }
}
