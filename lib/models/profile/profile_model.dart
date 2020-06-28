import 'cache_config_model.dart';
import 'user_model.dart';

class ProfileModel {
  UserModel user;
  CacheConfigModel cache;
  String token;
  int theme;
  String lastLogin;
  String locale;

  ProfileModel(
      {this.user,
      this.cache,
      this.token,
      this.theme,
      this.lastLogin,
      this.locale});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new UserModel.fromJson(json['user']) : null;
    cache = json['cache'] != null ? new CacheConfigModel.fromJson(json['cache']) : null;
    token = json['token'];
    theme = json['theme'];
    lastLogin = json['lastLogin'];
    locale = json['locale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.cache != null) {
      data['cache'] = this.cache.toJson();
    }
    data['token'] = this.token;
    data['theme'] = this.theme;
    data['lastLogin'] = this.lastLogin;
    data['locale'] = this.locale;
    return data;
  }
}
