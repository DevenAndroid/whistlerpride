class ModelHostHotel {
  bool? status;
  String? message;
  Data? data;

  ModelHostHotel({this.status, this.message, this.data});

  ModelHostHotel.fromJson(Map<String, dynamic> json) {
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
  String? hostHotelBanner;
  List<String>? hotelFeaturedImages;
  String? whistlerHotelTitle;
  String? whistlerHotelDescription;
  String? buttonName;
  String? buttonUrl;
  bool? isAnotherUrl;
  List<HostHotelLatLong>? hostHotelLatLong;

  Data(
      {this.hostHotelBanner,
        this.hotelFeaturedImages,
        this.whistlerHotelTitle,
        this.whistlerHotelDescription,
        this.buttonName,
        this.buttonUrl,
        this.isAnotherUrl,
        this.hostHotelLatLong});

  Data.fromJson(Map<String, dynamic> json) {
    hostHotelBanner = json['host_hotel_banner'];
    hotelFeaturedImages = json['hotel_featured_images'].cast<String>();
    whistlerHotelTitle = json['whistler_hotel_title'];
    whistlerHotelDescription = json['whistler_hotel_description'];
    buttonName = json['button_name'];
    buttonUrl = json['button_url'];
    isAnotherUrl = json['is_another_url'];
    if (json['host_hotel_lat_long'] != null) {
      hostHotelLatLong = <HostHotelLatLong>[];
      json['host_hotel_lat_long'].forEach((v) {
        hostHotelLatLong!.add(new HostHotelLatLong.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['host_hotel_banner'] = this.hostHotelBanner;
    data['hotel_featured_images'] = this.hotelFeaturedImages;
    data['whistler_hotel_title'] = this.whistlerHotelTitle;
    data['whistler_hotel_description'] = this.whistlerHotelDescription;
    data['button_name'] = this.buttonName;
    data['button_url'] = this.buttonUrl;
    data['is_another_url'] = this.isAnotherUrl;
    if (this.hostHotelLatLong != null) {
      data['host_hotel_lat_long'] =
          this.hostHotelLatLong!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HostHotelLatLong {
  String? eventTitle;
  String? latitude;
  String? longitude;

  HostHotelLatLong({this.eventTitle, this.latitude, this.longitude});

  HostHotelLatLong.fromJson(Map<String, dynamic> json) {
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
