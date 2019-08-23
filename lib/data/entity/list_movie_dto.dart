
import 'package:gdg_depok_2019_beginner/data/entity/movie_dto.dart';

class ListMoviesDto {
  int page;
  int totalResults;
  int totalPages;
  List<MovieDto> results;

  String error;

  ListMoviesDto(
      {this.page, this.totalResults, this.totalPages, this.results});

  ListMoviesDto.fromJson(Map<String, dynamic> json)
  {
    this.page = json['page'];
    this.totalResults = json['total_results'];
    this.totalPages = json['total_pages'];
    this.results = (json['results'] as List) != null
        ? (json['results'] as List).map((i) => MovieDto.fromJson(i)).toList()
        : null;
  }

  ListMoviesDto.withError(String error){
    this.error = error;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['total_results'] = this.totalResults;
    data['total_pages'] = this.totalPages;
    data['results'] = this.results != null
        ? this.results.map((i) => i.toJson()).toList()
        : null;
    return data;
  }

  @override
  ListMoviesDto init() {
    return ListMoviesDto();
  }
}
