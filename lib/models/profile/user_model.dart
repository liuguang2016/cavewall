class UserModel {
  String username;
  String avatar;
  String login;

  UserModel({this.username, this.avatar,this.login});

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    avatar = json['avatar'];
    login = json['login'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['avatar'] = this.avatar;
    data['login'] = this.login;
    return data;
  }
}
