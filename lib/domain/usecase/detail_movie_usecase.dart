
import 'dart:async';
import 'dart:collection';

import 'package:gdg_depok_2019_beginner/data/entity/list_movie_dto.dart';
import 'package:gdg_depok_2019_beginner/data/entity/movie_detail_dto.dart';
import 'package:gdg_depok_2019_beginner/data/entity/movie_dto.dart';
import 'package:gdg_depok_2019_beginner/data/provider/movies_provider_api.dart';
import 'package:gdg_depok_2019_beginner/domain/repository/movie_repository.dart';

class DetailMovieUseCase {

  static const movieIdKey = "movieId";

  final MovieRepository _movieRepository;

  DetailMovieUseCase() :
    _movieRepository = MoviesProviderApi();

  Stream<MovieDetailDto> _buildUseCase(Map<String,dynamic> data) {
    int movieId = data[movieIdKey] as int;
    return _movieRepository.getDetailMovie(movieId).asStream();
  }

  Future<MovieDetailDto> execute(Map<String,Object> data) {
     return _buildUseCase(data).single;
  }

}