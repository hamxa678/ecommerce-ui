class TopKeySearchModel {
  String? title;
  String? quantity;
  String? images;

  TopKeySearchModel({this.title, this.quantity, this.images});

  TopKeySearchModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    quantity = json['quantity'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['quantity'] = quantity;
    data['images'] = images;
    return data;
  }
}
