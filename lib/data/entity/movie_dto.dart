
class MovieDto {
  String posterPath;
  String overview;
  String releaseDate;
  String originalTitle;
  String originalLanguage;
  String title;
  String backdropPath;
  bool adult;
  bool video;
  double popularity;
  double voteAverage;
  int id;
  int voteCount;
  List<int> genreIds;

  MovieDto({this.posterPath, this.overview, this.releaseDate, this.originalTitle, this.originalLanguage, this.title, this.backdropPath, this.adult, this.video, this.popularity, this.voteAverage, this.id, this.voteCount, this.genreIds});

  MovieDto.fromJson(Map<String, dynamic> json) {
    this.posterPath = json['poster_path'];
    this.overview = json['overview'];
    this.releaseDate = json['release_date'];
    this.originalTitle = json['original_title'];
    this.originalLanguage = json['original_language'];
    this.title = json['title'];
    this.backdropPath = json['backdrop_path'];
    this.adult = json['adult'];
    this.video = json['video'];
    this.popularity = json['popularity'];
    this.voteAverage = json['vote_average'].toDouble();
    this.id = json['id'];
    this.voteCount = json['vote_count'];

    List<dynamic> genreIdsList = json['genre_ids'];
    this.genreIds = new List();
    this.genreIds.addAll(genreIdsList.map((o) => int.parse(o.toString())));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['poster_path'] = this.posterPath;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    data['original_title'] = this.originalTitle;
    data['original_language'] = this.originalLanguage;
    data['title'] = this.title;
    data['backdrop_path'] = this.backdropPath;
    data['adult'] = this.adult;
    data['video'] = this.video;
    data['popularity'] = this.popularity;
    data['vote_average'] = this.voteAverage;
    data['id'] = this.id;
    data['vote_count'] = this.voteCount;
    data['genre_ids'] = this.genreIds;
    return data;
  }
}
