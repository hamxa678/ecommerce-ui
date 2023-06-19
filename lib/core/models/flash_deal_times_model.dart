class FlashDealsTimesModel {
  String? title;
  String? time;

  FlashDealsTimesModel({this.title, this.time});

  FlashDealsTimesModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['time'] = time;
    return data;
  }
}
