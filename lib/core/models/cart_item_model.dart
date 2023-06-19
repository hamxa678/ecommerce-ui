class CartItemCard {
  String? imageURL;
  String? title;
  double? price;
  int? discount;
  int? noOfAvailableStock;

  CartItemCard(
      {this.imageURL,
      this.title,
      this.price,
      this.discount,
      this.noOfAvailableStock});

  CartItemCard.fromJson(Map<String, dynamic> json) {
    imageURL = json['imageURL'];
    title = json['title'];
    price = json['price'];
    discount = json['discount'];
    noOfAvailableStock = json['noOfAvailableStock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageURL'] = imageURL;
    data['title'] = title;
    data['price'] = price;
    data['discount'] = discount;
    data['noOfAvailableStock'] = noOfAvailableStock;
    return data;
  }
}
