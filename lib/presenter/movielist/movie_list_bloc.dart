import 'dart:async';

import 'package:gdg_depok_2019_beginner/data/entity/movie_dto.dart';
import 'package:gdg_depok_2019_beginner/domain/usecase/list_movie_usecase.dart';

class MovieListBloc {

  final _order = StreamController<List<MovieDto>>();

  final ListMovieUsecase _listMovieUsecase;

  MovieListBloc() : _listMovieUsecase = ListMovieUsecase();

  Stream<List<MovieDto>> get movies => _order.stream;

  void getMovies(int page) async {
    var data = Map<String,dynamic>();
    data[ListMovieUsecase.pageKey] = page;
    List<MovieDto> movieList = await _listMovieUsecase.execute(data);
    _order.sink.add(movieList);
  }

  void dispose() {
    _order.close();
  }
}
