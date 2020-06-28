class CacheConfigModel {
  bool enable;
  int maxAge;
  int maxCount;

  CacheConfigModel({this.enable, this.maxAge, this.maxCount});

  CacheConfigModel.fromJson(Map<String, dynamic> json) {
    enable = json['enable'];
    maxAge = json['maxAge'];
    maxCount = json['maxCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enable'] = this.enable;
    data['maxAge'] = this.maxAge;
    data['maxCount'] = this.maxCount;
    return data;
  }
}
