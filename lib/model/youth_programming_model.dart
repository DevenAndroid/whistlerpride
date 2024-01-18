class GetYouthProgrammingModel {
  bool? status;
  String? message;
  Data? data;

  GetYouthProgrammingModel({this.status, this.message, this.data});

  GetYouthProgrammingModel.fromJson(Map<String, dynamic> json) {
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
  String? youthProgrammingTitle;
  String? youthProgrammingBanner;
  String? welcomingTitle;
  String? welcomingDescription;
  List<YouthProgrammings>? youthProgrammings;

  Data(
      {this.youthProgrammingTitle,
        this.youthProgrammingBanner,
        this.welcomingTitle,
        this.welcomingDescription,
        this.youthProgrammings});

  Data.fromJson(Map<String, dynamic> json) {
    youthProgrammingTitle = json['youth_programming_title'];
    youthProgrammingBanner = json['youth_programming_banner'];
    welcomingTitle = json['welcoming_title'];
    welcomingDescription = json['welcoming_description'];
    if (json['youth_programmings'] != null) {
      youthProgrammings = <YouthProgrammings>[];
      json['youth_programmings'].forEach((v) {
        youthProgrammings!.add(new YouthProgrammings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['youth_programming_title'] = this.youthProgrammingTitle;
    data['youth_programming_banner'] = this.youthProgrammingBanner;
    data['welcoming_title'] = this.welcomingTitle;
    data['welcoming_description'] = this.welcomingDescription;
    if (this.youthProgrammings != null) {
      data['youth_programmings'] =
          this.youthProgrammings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class YouthProgrammings {
  String? programmingImage;
  String? programmingTitle;
  String? programmingDescription;
  String? dateAndPlace;
  String? buttonName;
  String? buttonUrl;
  bool? isAnotherUrl;

  YouthProgrammings(
      {this.programmingImage,
        this.programmingTitle,
        this.programmingDescription,
        this.dateAndPlace,
        this.buttonName,
        this.buttonUrl,
        this.isAnotherUrl});

  YouthProgrammings.fromJson(Map<String, dynamic> json) {
    programmingImage = json['programming_image'];
    programmingTitle = json['programming_title'];
    programmingDescription = json['programming_description'];
    dateAndPlace = json['date_and_place'];
    buttonName = json['button_name'];
    buttonUrl = json['button_url'];
    isAnotherUrl = json['is_another_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['programming_image'] = this.programmingImage;
    data['programming_title'] = this.programmingTitle;
    data['programming_description'] = this.programmingDescription;
    data['date_and_place'] = this.dateAndPlace;
    data['button_name'] = this.buttonName;
    data['button_url'] = this.buttonUrl;
    data['is_another_url'] = this.isAnotherUrl;
    return data;
  }
}
