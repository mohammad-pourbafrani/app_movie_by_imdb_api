class MostPopularMovieModel {
  String? id;
  String? rank;
  String? rankUpDown;
  String? title;
  String? fullTitle;
  String? year;
  String? image;
  String? crew;
  String? imDbRating;
  String? imDbRatingCount;

  MostPopularMovieModel({
    required this.id,
    required this.rank,
    required this.rankUpDown,
    required this.title,
    required this.fullTitle,
    required this.year,
    required this.image,
    required this.crew,
    required this.imDbRating,
    required this.imDbRatingCount,
  });

  MostPopularMovieModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    rank = element["rank"];
    rankUpDown = element["rankUpDown"];
    title = element["title"];
    fullTitle = element["fullTitle"];
    year = element["year"];
    image = element["image"];
    crew = element["crew"];
    imDbRating = element["imDbRating"];
    imDbRatingCount = element["imDbRatingCount"];
  }
}
