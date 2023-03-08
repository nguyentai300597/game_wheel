class userModel {
  bool? en;
  bool? dark;

  userModel({this.en = false, this.dark = false});

  userModel.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    dark = json['dark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    data['dark'] = this.dark;
    return data;
  }
}
