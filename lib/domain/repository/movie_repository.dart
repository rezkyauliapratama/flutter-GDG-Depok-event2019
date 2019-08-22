
import 'package:gdg_depok_2019_beginner/data/entity/list_movie_dto.dart';

abstract class MovieRepository {
  Future<ListMoviesDto> getListMovies(int page);
}