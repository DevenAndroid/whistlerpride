import 'package:google_maps_flutter/google_maps_flutter.dart';


class GetCharitySkiRaceModel {
  bool? status;
  dynamic message;
  Data? data;

  GetCharitySkiRaceModel({this.status, this.message, this.data});

  GetCharitySkiRaceModel.fromJson(Map<String, dynamic> json) {
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
  dynamic charityTitle;
  dynamic charityBanner;
  dynamic charity2024WelcomingTitle;
  dynamic charity2024WelcomingDescription;
  List<Charity2024WelcomingList>? charity2024WelcomingList;
  dynamic charity2024WelcomingExtraDes;
  dynamic charity2024CompanyTitle;
  dynamic charity2024CompanyDescription;
  dynamic charity2024CompanyLogo;
  dynamic charity2023WelcomingTitle;
  dynamic charity2023WelcomingDescription;
  List<WinnerTimeList>? winnerTimeList;
  dynamic charity2023CompanyTitle;
  dynamic charity2023CompanyDescription;
  dynamic charity2023CompanyLogo;
  dynamic promoBtnText;
  dynamic promoBtnUrl;
  List<EventLatLong>? eventLatLong;

  Data(
      {this.charityTitle,
        this.charityBanner,
        this.charity2024WelcomingTitle,
        this.charity2024WelcomingDescription,
        this.charity2024WelcomingList,
        this.charity2024WelcomingExtraDes,
        this.charity2024CompanyTitle,
        this.charity2024CompanyDescription,
        this.charity2024CompanyLogo,
        this.charity2023WelcomingTitle,
        this.charity2023WelcomingDescription,
        this.winnerTimeList,
        this.charity2023CompanyTitle,
        this.charity2023CompanyDescription,
        this.charity2023CompanyLogo,
        this.promoBtnText,
        this.promoBtnUrl,
        this.eventLatLong});

  Data.fromJson(Map<String, dynamic> json) {
    charityTitle = json['charity_title'];
    charityBanner = json['charity_banner'];
    charity2024WelcomingTitle = json['charity_2024_welcoming_title'];
    charity2024WelcomingDescription =
    json['charity_2024_welcoming_description'];
    if (json['charity_2024_welcoming_list'] != null) {
      charity2024WelcomingList = <Charity2024WelcomingList>[];
      json['charity_2024_welcoming_list'].forEach((v) {
        charity2024WelcomingList!.add(new Charity2024WelcomingList.fromJson(v));
      });
    }
    charity2024WelcomingExtraDes = json['charity_2024_welcoming_extra_des'];
    charity2024CompanyTitle = json['charity_2024_company_title'];
    charity2024CompanyDescription = json['charity_2024_company_description'];
    charity2024CompanyLogo = json['charity_2024_company_logo'];
    charity2023WelcomingTitle = json['charity_2023_welcoming_title'];
    charity2023WelcomingDescription =
    json['charity_2023_welcoming_description'];
    if (json['winner_time_list'] != null) {
      winnerTimeList = <WinnerTimeList>[];
      json['winner_time_list'].forEach((v) {
        winnerTimeList!.add(new WinnerTimeList.fromJson(v));
      });
    }
    charity2023CompanyTitle = json['charity_2023_company_title'];
    charity2023CompanyDescription = json['charity_2023_company_description'];
    charity2023CompanyLogo = json['charity_2023_company_logo'];
    promoBtnText = json['promo_btn_text'];
    promoBtnUrl = json['promo_btn_url'];
    if (json['event_lat_long'] != null) {
      eventLatLong = <EventLatLong>[];
      json['event_lat_long'].forEach((v) {
        eventLatLong!.add(new EventLatLong.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['charity_title'] = this.charityTitle;
    data['charity_banner'] = this.charityBanner;
    data['charity_2024_welcoming_title'] = this.charity2024WelcomingTitle;
    data['charity_2024_welcoming_description'] =
        this.charity2024WelcomingDescription;
    if (this.charity2024WelcomingList != null) {
      data['charity_2024_welcoming_list'] =
          this.charity2024WelcomingList!.map((v) => v.toJson()).toList();
    }
    data['charity_2024_welcoming_extra_des'] =
        this.charity2024WelcomingExtraDes;
    data['charity_2024_company_title'] = this.charity2024CompanyTitle;
    data['charity_2024_company_description'] =
        this.charity2024CompanyDescription;
    data['charity_2024_company_logo'] = this.charity2024CompanyLogo;
    data['charity_2023_welcoming_title'] = this.charity2023WelcomingTitle;
    data['charity_2023_welcoming_description'] =
        this.charity2023WelcomingDescription;
    if (this.winnerTimeList != null) {
      data['winner_time_list'] =
          this.winnerTimeList!.map((v) => v.toJson()).toList();
    }
    data['charity_2023_company_title'] = this.charity2023CompanyTitle;
    data['charity_2023_company_description'] =
        this.charity2023CompanyDescription;
    data['charity_2023_company_logo'] = this.charity2023CompanyLogo;
    data['promo_btn_text'] = this.promoBtnText;
    data['promo_btn_url'] = this.promoBtnUrl;
    if (this.eventLatLong != null) {
      data['event_lat_long'] =
          this.eventLatLong!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Charity2024WelcomingList {
  dynamic disList;

  Charity2024WelcomingList({this.disList});

  Charity2024WelcomingList.fromJson(Map<String, dynamic> json) {
    disList = json['dis_list'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dis_list'] = this.disList;
    return data;
  }
}

class WinnerTimeList {
  dynamic raceList;

  WinnerTimeList({this.raceList});

  WinnerTimeList.fromJson(Map<String, dynamic> json) {
    raceList = json['race_list'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['race_list'] = this.raceList;
    return data;
  }
}

class EventLatLong {
  dynamic eventTitle;
  dynamic latitude;
  dynamic longitude;
  LatLng? latLong;

  EventLatLong({this.eventTitle, this.latitude, this.longitude});

  EventLatLong.fromJson(Map<String, dynamic> json) {
    eventTitle = json['event_title'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    latLong = LatLng(double.tryParse(latitude.toString()) ?? 0 , double.tryParse(longitude.toString()) ?? 0);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_title'] = this.eventTitle;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
