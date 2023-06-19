class FilterItems {
  String? title;
  int? noOfItems;

  FilterItems({this.title, this.noOfItems});

  FilterItems.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    noOfItems = json['noOfItems'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['noOfItems'] = noOfItems;
    return data;
  }
}
