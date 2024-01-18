class GetPrideEatModel {
  bool? status;
  String? message;
  Data? data;

  GetPrideEatModel({this.status, this.message, this.data});

  GetPrideEatModel.fromJson(Map<String, dynamic> json) {
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
  String? prideEatsTitle;
  String? prideEatBanner;
  List<PrideEats>? prideEats;
  List<PrideEatsLatLong>? prideEatsLatLong;

  Data(
      {this.prideEatsTitle,
        this.prideEatBanner,
        this.prideEats,
        this.prideEatsLatLong});

  Data.fromJson(Map<String, dynamic> json) {
    prideEatsTitle = json['pride_eats_title'];
    prideEatBanner = json['pride_eat_banner'];
    if (json['pride_eats'] != null) {
      prideEats = <PrideEats>[];
      json['pride_eats'].forEach((v) {
        prideEats!.add(new PrideEats.fromJson(v));
      });
    }
    if (json['pride_eats_lat_long'] != null) {
      prideEatsLatLong = <PrideEatsLatLong>[];
      json['pride_eats_lat_long'].forEach((v) {
        prideEatsLatLong!.add(new PrideEatsLatLong.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pride_eats_title'] = this.prideEatsTitle;
    data['pride_eat_banner'] = this.prideEatBanner;
    if (this.prideEats != null) {
      data['pride_eats'] = this.prideEats!.map((v) => v.toJson()).toList();
    }
    if (this.prideEatsLatLong != null) {
      data['pride_eats_lat_long'] =
          this.prideEatsLatLong!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PrideEats {
  String? prideEatImage;
  String? prideEatTitle;
  String? prideEatDescription;
  String? placeAndNumber;
  String? buttonName;
  String? buttonUrl;
  String? latitude;
  String? longitude;
  bool? isAnotherUrl;

  PrideEats(
      {this.prideEatImage,
        this.prideEatTitle,
        this.prideEatDescription,
        this.placeAndNumber,
        this.buttonName,
        this.buttonUrl,
        this.latitude,
        this.longitude,
        this.isAnotherUrl});

  PrideEats.fromJson(Map<String, dynamic> json) {
    prideEatImage = json['pride_eat_image'];
    prideEatTitle = json['pride_eat_title'];
    prideEatDescription = json['pride_eat_description'];
    placeAndNumber = json['place_and_number'];
    buttonName = json['button_name'];
    buttonUrl = json['button_url'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isAnotherUrl = json['is_another_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pride_eat_image'] = this.prideEatImage;
    data['pride_eat_title'] = this.prideEatTitle;
    data['pride_eat_description'] = this.prideEatDescription;
    data['place_and_number'] = this.placeAndNumber;
    data['button_name'] = this.buttonName;
    data['button_url'] = this.buttonUrl;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['is_another_url'] = this.isAnotherUrl;
    return data;
  }
}

class PrideEatsLatLong {
  String? eventTitle;
  String? latitude;
  String? longitude;

  PrideEatsLatLong({this.eventTitle, this.latitude, this.longitude});

  PrideEatsLatLong.fromJson(Map<String, dynamic> json) {
    eventTitle = json['event_title'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_title'] = this.eventTitle;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
