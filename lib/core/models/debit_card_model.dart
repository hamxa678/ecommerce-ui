class DebitCardDetail {
  String? name;
  int? phoneNo;
  String? email;
  int? cardNo;

  DebitCardDetail({this.name, this.phoneNo, this.email, this.cardNo});

  DebitCardDetail.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phoneNo = json['phoneNo'];
    email = json['email'];
    cardNo = json['cardNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phoneNo'] = phoneNo;
    data['email'] = email;
    data['cardNo'] = cardNo;
    return data;
  }
}
