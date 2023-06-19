class FeaturedCardModel {
  String? title;
  String? backGroundImage;
  SubImages? images;

  FeaturedCardModel({this.title, this.backGroundImage, this.images});

  FeaturedCardModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    backGroundImage = json['backGroundImage'];
    images = json['images'] != null ? SubImages.fromJson(json['images']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['backGroundImage'] = backGroundImage;
    if (images != null) {
      data['images'] = images!.toJson();
    }
    return data;
  }
}

class SubImages {
  String? image1;
  String? image2;
  String? image3;

  SubImages({this.image1, this.image2, this.image3});

  SubImages.fromJson(Map<String, dynamic> json) {
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
