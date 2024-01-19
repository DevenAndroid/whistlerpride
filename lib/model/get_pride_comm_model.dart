import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetParadeAndCommModel {
  bool? status;
  dynamic message;
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
  dynamic paradeCommunityTitle;
  dynamic paradeCommunityBanner;
  dynamic celebrationPresentedImage;
  List<PrideCelebrationLists>? prideCelebrationLists;
  dynamic youthProgrammingImage;
  dynamic youthProgrammingTitle;
  dynamic youthProgrammingDescription;
  dynamic youthProgrammingButtonName;
  dynamic youthProgrammingButtonUrl;
  List<HostHotelLatLong>? hostHotelLatLong;

  Data(
      {this.paradeCommunityTitle,
        this.paradeCommunityBanner,
        this.celebrationPresentedImage,
        this.prideCelebrationLists,
        this.youthProgrammingImage,
        this.youthProgrammingTitle,
        this.youthProgrammingDescription,
        this.youthProgrammingButtonName,
        this.youthProgrammingButtonUrl,
        this.hostHotelLatLong});

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
    youthProgrammingButtonName = json['youth_programming_button_name'];
    youthProgrammingButtonUrl = json['youth_programming_button_url'];
    if (json['host_hotel_lat_long'] != null) {
      hostHotelLatLong = <HostHotelLatLong>[];
      json['host_hotel_lat_long'].forEach((v) {
        hostHotelLatLong!.add(new HostHotelLatLong.fromJson(v));
      });
    }
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
    data['youth_programming_button_name'] = this.youthProgrammingButtonName;
    data['youth_programming_button_url'] = this.youthProgrammingButtonUrl;
    if (this.hostHotelLatLong != null) {
      data['host_hotel_lat_long'] =
          this.hostHotelLatLong!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PrideCelebrationLists {
  dynamic celebrationImage;
  dynamic celebrationTitle;
  dynamic celebrationDescription;
  dynamic celebrationButtonName;
  dynamic celebrationButtonUrl;
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

class HostHotelLatLong {
  dynamic eventTitle;
  dynamic latitude;
  dynamic longitude;
  LatLng? latLong;
  HostHotelLatLong({this.eventTitle, this.latitude, this.longitude});

  HostHotelLatLong.fromJson(Map<String, dynamic> json) {
    eventTitle = json['event_title'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    latLong = LatLng(double.tryParse(latitude.toString()) ?? 0, double.tryParse(longitude.toString()) ?? 0);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_title'] = this.eventTitle;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
