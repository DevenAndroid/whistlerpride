class AboutModel {
  bool? status;
  String? message;
  Data? data;

  AboutModel({this.status, this.message, this.data});

  AboutModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? aboutTitle;
  String? aboutContent;
  String? aboutBanner;

  Data({this.aboutTitle, this.aboutContent, this.aboutBanner});

  Data.fromJson(Map<String, dynamic> json) {
    aboutTitle = json['about_title'];
    aboutContent = json['about_content'];
    aboutBanner = json['about_banner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about_title'] = this.aboutTitle;
    data['about_content'] = this.aboutContent;
    data['about_banner'] = this.aboutBanner;
    return data;
  }
}
