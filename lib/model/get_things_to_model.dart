import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetThingsToDoModel {
  bool? status;
  dynamic message;
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
  dynamic thingsInWhistlerTitle;
  dynamic thingsInWhistlerBanner;
  dynamic experienceMoreTitle;
  dynamic experienceMoreDescription;
  List<ThingsWhistlerLists>? thingsWhistlerLists;
  List<HostHotelLatLong>? hostHotelLatLong;

  Data(
      {this.thingsInWhistlerTitle,
        this.thingsInWhistlerBanner,
        this.experienceMoreTitle,
        this.experienceMoreDescription,
        this.thingsWhistlerLists,
        this.hostHotelLatLong});

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
    if (json['host_hotel_lat_long'] != null) {
      hostHotelLatLong = <HostHotelLatLong>[];
      json['host_hotel_lat_long'].forEach((v) {
        hostHotelLatLong!.add(new HostHotelLatLong.fromJson(v));
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
    if (this.hostHotelLatLong != null) {
      data['host_hotel_lat_long'] =
          this.hostHotelLatLong!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ThingsWhistlerLists {
  dynamic thingsWhistlerImage;
  dynamic thingsWhistlerTitle;
  dynamic thingsWhistlerDescription;
  dynamic buttonName;
  dynamic buttonUrl;
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
