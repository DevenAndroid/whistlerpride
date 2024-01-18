class GetParadeAndCommModel {
  bool? status;
  String? message;
  Data? data;

  GetParadeAndCommModel({this.status, this.message, this.data});

  GetParadeAndCommModel.fromJson(Map<String, dynamic> json) {
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
  String? paradeCommunityTitle;
  String? paradeCommunityBanner;
  String? celebrationPresentedImage;
  List<PrideCelebrationLists>? prideCelebrationLists;
  String? youthProgrammingImage;
  String? youthProgrammingTitle;
  String? youthProgrammingDescription;
  String? celebrationButtonName;
  Null? celebrationButtonUrl;

  Data(
      {this.paradeCommunityTitle,
        this.paradeCommunityBanner,
        this.celebrationPresentedImage,
        this.prideCelebrationLists,
        this.youthProgrammingImage,
        this.youthProgrammingTitle,
        this.youthProgrammingDescription,
        this.celebrationButtonName,
        this.celebrationButtonUrl});

  Data.fromJson(Map<String, dynamic> json) {
    paradeCommunityTitle = json['parade_community_title'];
    paradeCommunityBanner = json['parade_community_banner'];
    celebrationPresentedImage = json['celebration_presented_image'];
    if (json['pride_celebration_lists'] != null) {
      prideCelebrationLists = <PrideCelebrationLists>[];
      json['pride_celebration_lists'].forEach((v) {
        prideCelebrationLists!.add(new PrideCelebrationLists.fromJson(v));
      });
    }
    youthProgrammingImage = json['youth_programming_image'];
    youthProgrammingTitle = json['youth_programming_title'];
    youthProgrammingDescription = json['youth_programming_description'];
    celebrationButtonName = json['celebration_button_name'];
    celebrationButtonUrl = json['celebration_button_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parade_community_title'] = this.paradeCommunityTitle;
    data['parade_community_banner'] = this.paradeCommunityBanner;
    data['celebration_presented_image'] = this.celebrationPresentedImage;
    if (this.prideCelebrationLists != null) {
      data['pride_celebration_lists'] =
          this.prideCelebrationLists!.map((v) => v.toJson()).toList();
    }
    data['youth_programming_image'] = this.youthProgrammingImage;
    data['youth_programming_title'] = this.youthProgrammingTitle;
    data['youth_programming_description'] = this.youthProgrammingDescription;
    data['celebration_button_name'] = this.celebrationButtonName;
    data['celebration_button_url'] = this.celebrationButtonUrl;
    return data;
  }
}

class PrideCelebrationLists {
  String? celebrationImage;
  String? celebrationTitle;
  String? celebrationDescription;
  String? celebrationButtonName;
  String? celebrationButtonUrl;
  bool? isAnotherUrl;

  PrideCelebrationLists(
      {this.celebrationImage,
        this.celebrationTitle,
        this.celebrationDescription,
        this.celebrationButtonName,
        this.celebrationButtonUrl,
        this.isAnotherUrl});

  PrideCelebrationLists.fromJson(Map<String, dynamic> json) {
    celebrationImage = json['celebration_image'];
    celebrationTitle = json['celebration_title'];
    celebrationDescription = json['celebration_description'];
    celebrationButtonName = json['celebration_button_name'];
    celebrationButtonUrl = json['celebration_button_url'];
    isAnotherUrl = json['is_another_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['celebration_image'] = this.celebrationImage;
    data['celebration_title'] = this.celebrationTitle;
    data['celebration_description'] = this.celebrationDescription;
    data['celebration_button_name'] = this.celebrationButtonName;
    data['celebration_button_url'] = this.celebrationButtonUrl;
    data['is_another_url'] = this.isAnotherUrl;
    return data;
  }
}
