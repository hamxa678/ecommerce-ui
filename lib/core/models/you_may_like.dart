class YouMayKnowModel {
  String? title;
  String? quantity;
  Images? images;

  YouMayKnowModel({this.title, this.quantity, this.images});

  YouMayKnowModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    quantity = json['quantity'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['quantity'] = quantity;
    if (images != null) {
      data['images'] = images!.toJson();
    }
    return data;
  }
}

class Images {
  String? image1;
  String? image2;
  String? image3;

  Images({this.image1, this.image2, this.image3});

  Images.fromJson(Map<String, dynamic> json) {
    image1 = json['image1'];
    image2 = json['image2'];
    image3 = json['image3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image1'] = image1;
    data['image2'] = image2;
    data['image3'] = image3;
    return data;
  }
}
