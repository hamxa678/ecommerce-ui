class ReadyToCheckOutModel {
  String? imageURL;
  String? title;
  String? sizeLength;
  double? price;

  ReadyToCheckOutModel(
      {this.imageURL, this.title, this.sizeLength, this.price});

  ReadyToCheckOutModel.fromJson(Map<String, dynamic> json) {
    imageURL = json['imageURL'];
    title = json['title'];
    sizeLength = json['sizeLength'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageURL'] = imageURL;
    data['title'] = title;
    data['sizeLength'] = sizeLength;
    data['price'] = price;
    return data;
  }
}
