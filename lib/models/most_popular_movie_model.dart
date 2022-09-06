class MostPopularMovieModel {
  int? id;
  String? title;
  String? poster;
  String? year;
  String? country;
  String? imdbRating;
  List<dynamic>? genres;
  List<dynamic>? images;

  MostPopularMovieModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.year,
    required this.country,
    required this.imdbRating,
    required this.genres,
    required this.images,
  });

  MostPopularMovieModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    poster = element["poster"];
    year = element["year"];
    title = element["title"];
    country = element["country"];
    imdbRating = element["imdb_rating"];
    genres = element["genres"];
    images = element["images"];
  }
}
