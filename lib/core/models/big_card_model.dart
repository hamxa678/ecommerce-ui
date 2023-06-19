class BigCard {
  String? image;
  String? title;
  String? newPrice;
  String? discount;
  String? totalProduct;
  String? productSold;

  BigCard(
      {this.image,
      this.title,
      this.newPrice,
      this.discount,
      this.totalProduct,
      this.productSold});

  BigCard.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    newPrice = json['newPrice'];
    discount = json['discount'];
    totalProduct = json['totalProduct'];
    productSold = json['productSold'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['image'] = image;
    data['title'] = title;
    data['newPrice'] = newPrice;
    data['discount'] = discount;
    data['totalProduct'] = totalProduct;
    data['productSold'] = productSold;
    return data;
  }
}
