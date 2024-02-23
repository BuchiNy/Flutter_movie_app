class Movie {
  late String title;
  late String backDropPath;
  late String originalTitle;
  late String overview;
  late String posterPath;
  late String releaseDate;
  late double voterAverage;

  Movie(
      {required this.title,
      required this.backDropPath,
      required this.originalTitle,
      required this.overview,
      required this.posterPath,
      required this.releaseDate,
      required this.voterAverage});

  factory Movie.fromJSON(Map<String, dynamic> json) {
    return Movie(
      title: json["title"] as String,
      backDropPath: json["backdrop_path"] as String,
      originalTitle: json["original_title"] as String,
      overview: json["overview"] as String,
      posterPath: json["poster_path"] as String,
      releaseDate: json["release_date"] as String,
      voterAverage: json["vote_average"] as double,
    );
  }
}
