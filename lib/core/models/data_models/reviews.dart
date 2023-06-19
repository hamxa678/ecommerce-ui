class Reviews {
  int? id;
  String imageURL;
  String? name;
  String? date;
  String? review;
  double stars;
  double? heart;
  double? message;

  Reviews({
    this.id,
    required this.imageURL,
    this.date,
    this.name,
    this.heart,
    this.message,
    this.review,
    required this.stars,
  });
}
