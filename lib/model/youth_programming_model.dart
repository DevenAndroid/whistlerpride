import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetYouthProgrammingModel {
  bool? status;
  dynamic message;
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
  dynamic youthProgrammingTitle;
  dynamic youthProgrammingBanner;
  dynamic welcomingTitle;
  dynamic welcomingDescription;
  List<YouthProgrammings>? youthProgrammings;
  List<HostHotelLatLong>? hostHotelLatLong;

  Data(
      {this.youthProgrammingTitle,
        this.youthProgrammingBanner,
        this.welcomingTitle,
        this.welcomingDescription,
        this.youthProgrammings,
        this.hostHotelLatLong});

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
    if (json['host_hotel_lat_long'] != null) {
      hostHotelLatLong = <HostHotelLatLong>[];
      json['host_hotel_lat_long'].forEach((v) {
        hostHotelLatLong!.add(new HostHotelLatLong.fromJson(v));
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
    if (this.hostHotelLatLong != null) {
      data['host_hotel_lat_long'] =
          this.hostHotelLatLong!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class YouthProgrammings {
  dynamic programmingImage;
  dynamic programmingTitle;
  dynamic programmingDescription;
  dynamic dateAndPlace;
  dynamic buttonName;
  dynamic buttonUrl;
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

class HostHotelLatLong {
  dynamic eventTitle;
  dynamic latitude;
  dynamic longitude;
  LatLng? latLong ;

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
