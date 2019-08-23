import 'dart:async';

import 'package:gdg_depok_2019_beginner/data/entity/movie_detail_dto.dart';
import 'package:gdg_depok_2019_beginner/data/entity/movie_dto.dart';
import 'package:gdg_depok_2019_beginner/domain/usecase/detail_movie_usecase.dart';
import 'package:gdg_depok_2019_beginner/domain/usecase/list_movie_usecase.dart';

class DetailMovieBloc {

  final _order = StreamController<MovieDetailDto>();

  final DetailMovieUseCase _detailMovieUsecase;

  DetailMovieBloc() : _detailMovieUsecase = DetailMovieUseCase();

  Stream<MovieDetailDto> get detailMovie => _order.stream;

  void getDetailMovie(int movieId) async {
    var data = Map<String,dynamic>();
    data[DetailMovieUseCase.movieIdKey] = movieId;
    MovieDetailDto detailMovie = await _detailMovieUsecase.execute(data);
    _order.sink.add(detailMovie);
  }

  void dispose() {
    _order.close();
  }
}
