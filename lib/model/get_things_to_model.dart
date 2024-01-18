class GetThingsToDoModel {
  bool? status;
  String? message;
  Data? data;

  GetThingsToDoModel({this.status, this.message, this.data});

  GetThingsToDoModel.fromJson(Map<String, dynamic> json) {
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
  String? thingsInWhistlerTitle;
  String? thingsInWhistlerBanner;
  String? experienceMoreTitle;
  String? experienceMoreDescription;
  List<ThingsWhistlerLists>? thingsWhistlerLists;

  Data(
      {this.thingsInWhistlerTitle,
        this.thingsInWhistlerBanner,
        this.experienceMoreTitle,
        this.experienceMoreDescription,
        this.thingsWhistlerLists});

  Data.fromJson(Map<String, dynamic> json) {
    thingsInWhistlerTitle = json['things_in_whistler_title'];
    thingsInWhistlerBanner = json['things_in_whistler_banner'];
    experienceMoreTitle = json['experience_more_title'];
    experienceMoreDescription = json['experience_more_description'];
    if (json['things_whistler_lists'] != null) {
      thingsWhistlerLists = <ThingsWhistlerLists>[];
      json['things_whistler_lists'].forEach((v) {
        thingsWhistlerLists!.add(new ThingsWhistlerLists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['things_in_whistler_title'] = this.thingsInWhistlerTitle;
    data['things_in_whistler_banner'] = this.thingsInWhistlerBanner;
    data['experience_more_title'] = this.experienceMoreTitle;
    data['experience_more_description'] = this.experienceMoreDescription;
    if (this.thingsWhistlerLists != null) {
      data['things_whistler_lists'] =
          this.thingsWhistlerLists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ThingsWhistlerLists {
  String? thingsWhistlerImage;
  String? thingsWhistlerTitle;
  String? thingsWhistlerDescription;
  String? buttonName;
  String? buttonUrl;
  bool? isAnotherUrl;

  ThingsWhistlerLists(
      {this.thingsWhistlerImage,
        this.thingsWhistlerTitle,
        this.thingsWhistlerDescription,
        this.buttonName,
        this.buttonUrl,
        this.isAnotherUrl});

  ThingsWhistlerLists.fromJson(Map<String, dynamic> json) {
    thingsWhistlerImage = json['things_whistler_image'];
    thingsWhistlerTitle = json['things_whistler_title'];
    thingsWhistlerDescription = json['things_whistler_description'];
    buttonName = json['button_name'];
    buttonUrl = json['button_url'];
    isAnotherUrl = json['is_another_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['things_whistler_image'] = this.thingsWhistlerImage;
    data['things_whistler_title'] = this.thingsWhistlerTitle;
    data['things_whistler_description'] = this.thingsWhistlerDescription;
    data['button_name'] = this.buttonName;
    data['button_url'] = this.buttonUrl;
    data['is_another_url'] = this.isAnotherUrl;
    return data;
  }
}
