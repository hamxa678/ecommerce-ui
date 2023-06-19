class BrandModel {
  String? image;
  String? title;

  BrandModel({this.image, this.title});

  BrandModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['image'] = image;
    data['title'] = title;
    return data;
  }
}
