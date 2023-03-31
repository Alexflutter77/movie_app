class Movie {
  int id;
  String title;
  String posterPath;

  String originalTitle;
  double voteAverage;
  String overview;
  String releaseDate;

  Movie(this.id, this.title, this.posterPath, this.originalTitle,
      this.voteAverage, this.overview, this.releaseDate);

  factory Movie.fromJson(Map<String, dynamic> json) {
    int NewId = int.parse(json["id"].toString());
    String NewTitle = json["title"];
    String NewposterPath = json["poster_path"];

    String NeworiginalTitle = json["original_title"];
    double NewvoteAverage = double.parse(json["vote_average"].toString());
    String Newoverview = json["overview"];
    String NewreleaseDate = json["release_date"].toString();

    Movie movie = Movie(NewId, NewTitle, NewposterPath, NeworiginalTitle,
        NewvoteAverage, Newoverview, NewreleaseDate);
    return movie;
  }

  Map<String, dynamic> toJson() => {};

  @override
  String toString() {
    return ' id=$id, title = $title, posterPath = $posterPath, originalTitle = $originalTitle, voteAverage = $voteAverage, overview = $overview, releaseDate = $releaseDate ';
  }
}
