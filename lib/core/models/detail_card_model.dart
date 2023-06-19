class DetailedCardModel {
  String? title;
  double? rating;
  int? noOfRating;
  double? newPrice;
  int? discountPercentage;
  String? imageURL;
  int? installmentPercent;

  DetailedCardModel(
      {this.title,
      this.rating,
      this.noOfRating,
      this.newPrice,
      this.discountPercentage,
      this.imageURL,
      this.installmentPercent});

  DetailedCardModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    rating = json['rating'];
    noOfRating = json['noOfRating'];
    newPrice = json['newPrice'];
    discountPercentage = json['discountPercentage'];
    imageURL = json['imageURL'];
    installmentPercent = json['installmentPercent'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    data['rating'] = rating;
    data['noOfRating'] = noOfRating;
    data['newPrice'] = newPrice;
    data['discountPercentage'] = discountPercentage;
    data['imageURL'] = imageURL;
    data['installmentPercent'] = installmentPercent;
    return data;
  }
}
