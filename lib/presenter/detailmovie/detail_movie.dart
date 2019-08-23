import 'package:flutter/material.dart';
import 'package:gdg_depok_2019_beginner/data/entity/movie_detail_dto.dart';
import 'package:shimmer/shimmer.dart';

import 'detail_movie_bloc.dart';

class DetailMovieView extends StatelessWidget {
  final int _movieId;

  DetailMovieView(this._movieId);

  @override
  Widget build(BuildContext context) {
    final detailMovieBloc = DetailMovieBloc();
    detailMovieBloc.getDetailMovie(_movieId);
    return Scaffold(
        body: StreamBuilder(
            stream: detailMovieBloc.detailMovie,
            builder: (BuildContext context,
                AsyncSnapshot<MovieDetailDto> snapshot) {
              if (snapshot.hasData) {
                return _BodyMoviesDetail(snapshot.data);
              } else {
                return _LoadingPage();
              }
            }));  }

}


class _BodyMoviesDetail extends StatelessWidget {
  final MovieDetailDto _movie;

  _BodyMoviesDetail(this._movie);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(_movie.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    )),
                background: _backgroundPoster()),
          ),
        ];
      },
      body: _body(),
    );
  }

  Widget _body() {
    List<Widget> children = [
      Text(
        "Overview",
        textAlign: TextAlign.start,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
      ),
      Text(
        _movie.overview,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.justify,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
      ),
      Text(
        "Vote : ${_movie.voteAverage} / 10",
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.justify,
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
      ),
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _backgroundPoster() {
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
          "http://image.tmdb.org/t/p/w780/" + _movie.backdropPath,
          fit: BoxFit.cover,
        )
      ],
    );
  }
}


class _LoadingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
