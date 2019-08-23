class MovieDetailDto {
  String backdropPath;

//  String belongsToCollection;
  String homepage;
  String imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  String status;
  String tagline;
  String title;
  bool adult;
  bool video;
  double popularity;
  double voteAverage;
  int budget;
  int id;
  int revenue;
  int runtime;
  int voteCount;
  List<GenresListBean> genres;
  List<ProductionCompaniesListBean> productionCompanies;
  List<ProductionCountriesListBean> productionCountries;
  List<SpokenLanguagesListBean> spokenLanguages;

  String error;

  MovieDetailDto(
      {this.backdropPath,
      this.homepage,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.releaseDate,
      this.status,
      this.tagline,
      this.title,
      this.adult,
      this.video,
      this.popularity,
      this.voteAverage,
      this.budget,
      this.id,
      this.revenue,
      this.runtime,
      this.voteCount,
      this.genres,
      this.productionCompanies,
      this.productionCountries,
      this.spokenLanguages});

  MovieDetailDto.fromJson(Map<String, dynamic> json) {
    this.backdropPath = json['backdrop_path'];
//    this.belongsToCollection = json['belongs_to_collection'];
    this.homepage = json['homepage'];
    this.imdbId = json['imdb_id'];
    this.originalLanguage = json['original_language'];
    this.originalTitle = json['original_title'];
    this.overview = json['overview'];
    this.posterPath = json['poster_path'];
    this.releaseDate = json['release_date'];
    this.status = json['status'];
    this.tagline = json['tagline'];
    this.title = json['title'];
    this.adult = json['adult'];
    this.video = json['video'];
    this.popularity = json['popularity'];
    this.voteAverage = json['vote_average'];
    this.budget = json['budget'];
    this.id = json['id'];
    this.revenue = json['revenue'];
    this.runtime = json['runtime'];
    this.voteCount = json['vote_count'];
    this.genres = (json['genres'] as List) != null
        ? (json['genres'] as List)
            .map((i) => GenresListBean.fromJson(i))
            .toList()
        : null;
    this.productionCompanies = (json['production_companies'] as List) != null
        ? (json['production_companies'] as List)
            .map((i) => ProductionCompaniesListBean.fromJson(i))
            .toList()
        : null;
    this.productionCountries = (json['production_countries'] as List) != null
        ? (json['production_countries'] as List)
            .map((i) => ProductionCountriesListBean.fromJson(i))
            .toList()
        : null;
    this.spokenLanguages = (json['spoken_languages'] as List) != null
        ? (json['spoken_languages'] as List)
            .map((i) => SpokenLanguagesListBean.fromJson(i))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['backdrop_path'] = this.backdropPath;
//    data['belongs_to_collection'] = this.belongsToCollection;
    data['homepage'] = this.homepage;
    data['imdb_id'] = this.imdbId;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['release_date'] = this.releaseDate;
    data['status'] = this.status;
    data['tagline'] = this.tagline;
    data['title'] = this.title;
    data['adult'] = this.adult;
    data['video'] = this.video;
    data['popularity'] = this.popularity;
    data['vote_average'] = this.voteAverage;
    data['budget'] = this.budget;
    data['id'] = this.id;
    data['revenue'] = this.revenue;
    data['runtime'] = this.runtime;
    data['vote_count'] = this.voteCount;
    data['genres'] = this.genres != null
        ? this.genres.map((i) => i.toJson()).toList()
        : null;
    data['production_companies'] = this.productionCompanies != null
        ? this.productionCompanies.map((i) => i.toJson()).toList()
        : null;
    data['production_countries'] = this.productionCountries != null
        ? this.productionCountries.map((i) => i.toJson()).toList()
        : null;
    data['spoken_languages'] = this.spokenLanguages != null
        ? this.spokenLanguages.map((i) => i.toJson()).toList()
        : null;
    return data;
  }


  MovieDetailDto.withError(String error){
    this.error = error;
  }
}

class GenresListBean {
  String name;
  int id;

  GenresListBean({this.name, this.id});

  GenresListBean.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}

class ProductionCompaniesListBean {
  String logoPath;
  String name;
  String originCountry;
  int id;

  ProductionCompaniesListBean(
      {this.logoPath, this.name, this.originCountry, this.id});

  ProductionCompaniesListBean.fromJson(Map<String, dynamic> json) {
    this.logoPath = json['logo_path'];
    this.name = json['name'];
    this.originCountry = json['origin_country'];
    this.id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['logo_path'] = this.logoPath;
    data['name'] = this.name;
    data['origin_country'] = this.originCountry;
    data['id'] = this.id;
    return data;
  }
}

class ProductionCountriesListBean {
  String iso31661;
  String name;

  ProductionCountriesListBean({this.iso31661, this.name});

  ProductionCountriesListBean.fromJson(Map<String, dynamic> json) {
    this.iso31661 = json['iso_3166_1'];
    this.name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_3166_1'] = this.iso31661;
    data['name'] = this.name;
    return data;
  }
}

class SpokenLanguagesListBean {
  String iso6391;
  String name;

  SpokenLanguagesListBean({this.iso6391, this.name});

  SpokenLanguagesListBean.fromJson(Map<String, dynamic> json) {
    this.iso6391 = json['iso_639_1'];
    this.name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_639_1'] = this.iso6391;
    data['name'] = this.name;
    return data;
  }
}
