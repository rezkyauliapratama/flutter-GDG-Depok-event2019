
import 'dart:async';
import 'dart:collection';

import 'package:gdg_depok_2019_beginner/data/entity/list_movie_dto.dart';
import 'package:gdg_depok_2019_beginner/data/entity/movie_dto.dart';
import 'package:gdg_depok_2019_beginner/data/provider/movies_provider_api.dart';
import 'package:gdg_depok_2019_beginner/domain/repository/movie_repository.dart';

class ListMovieUsecase {

  static const pageKey = "page";

  final MovieRepository _movieRepository;

  ListMovieUsecase() :
    _movieRepository = MoviesProviderApi();

  Stream<List<MovieDto>> _buildUseCase(Map<String,dynamic> data) {
    int page = data[pageKey] as int;
    return _movieRepository.getListMovies(page).asStream().map((ListMoviesDto listMovieDto) => listMovieDto.results);
  }

  Future<List<MovieDto>> execute(Map<String,Object> data) {
     return _buildUseCase(data).single;
  }

}