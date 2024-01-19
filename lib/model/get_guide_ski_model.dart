import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetGuideSkiModel {
  bool? status;
  dynamic message;
  Data? data;

  GetGuideSkiModel({this.status, this.message, this.data});

  GetGuideSkiModel.fromJson(Map<String, dynamic> json) {
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
  dynamic guidedSkiRideTitle;
  dynamic guidedSkiRideBanner;
  dynamic guidedSkiRideMoreTitle;
  dynamic guidedSkiRideMoreImg;
  dynamic guidedSkiRideMoreDescription;
  dynamic guidedSkiRideButtonTitle;
  dynamic guidedSkiRideButtonUrl;
  List<TicketAndRentals>? ticketAndRentals;
  List<HostHotelLatLong>? hostHotelLatLong;

  Data(
      {this.guidedSkiRideTitle,
        this.guidedSkiRideBanner,
        this.guidedSkiRideMoreTitle,
        this.guidedSkiRideMoreImg,
        this.guidedSkiRideMoreDescription,
        this.guidedSkiRideButtonTitle,
        this.guidedSkiRideButtonUrl,
        this.ticketAndRentals,
        this.hostHotelLatLong});

  Data.fromJson(Map<String, dynamic> json) {
    guidedSkiRideTitle = json['guided_ski_ride_title'];
    guidedSkiRideBanner = json['guided_ski_ride_banner'];
    guidedSkiRideMoreTitle = json['guided_ski_ride_more_title'];
    guidedSkiRideMoreImg = json['guided_ski_ride_more_img'];
    guidedSkiRideMoreDescription = json['guided_ski_ride_more_description'];
    guidedSkiRideButtonTitle = json['guided_ski_ride_button_title'];
    guidedSkiRideButtonUrl = json['guided_ski_ride_button_url'];
    if (json['ticket_and_rentals'] != null) {
      ticketAndRentals = <TicketAndRentals>[];
      json['ticket_and_rentals'].forEach((v) {
        ticketAndRentals!.add(new TicketAndRentals.fromJson(v));
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
    data['guided_ski_ride_title'] = this.guidedSkiRideTitle;
    data['guided_ski_ride_banner'] = this.guidedSkiRideBanner;
    data['guided_ski_ride_more_title'] = this.guidedSkiRideMoreTitle;
    data['guided_ski_ride_more_img'] = this.guidedSkiRideMoreImg;
    data['guided_ski_ride_more_description'] =
        this.guidedSkiRideMoreDescription;
    data['guided_ski_ride_button_title'] = this.guidedSkiRideButtonTitle;
    data['guided_ski_ride_button_url'] = this.guidedSkiRideButtonUrl;
    if (this.ticketAndRentals != null) {
      data['ticket_and_rentals'] =
          this.ticketAndRentals!.map((v) => v.toJson()).toList();
    }
    if (this.hostHotelLatLong != null) {
      data['host_hotel_lat_long'] =
          this.hostHotelLatLong!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TicketAndRentals {
  dynamic ticketAndRentalsImage;
  dynamic ticketAndRentalsTitle;
  dynamic ticketAndRentalsDescription;
  dynamic buttonName;
  dynamic buttonUrl;
  bool? isAnotherUrl;

  TicketAndRentals(
      {this.ticketAndRentalsImage,
        this.ticketAndRentalsTitle,
        this.ticketAndRentalsDescription,
        this.buttonName,
        this.buttonUrl,
        this.isAnotherUrl});

  TicketAndRentals.fromJson(Map<String, dynamic> json) {
    ticketAndRentalsImage = json['ticket_and_rentals_image'];
    ticketAndRentalsTitle = json['ticket_and_rentals_title'];
    ticketAndRentalsDescription = json['ticket_and_rentals_description'];
    buttonName = json['button_name'];
    buttonUrl = json['button_url'];
    isAnotherUrl = json['is_another_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ticket_and_rentals_image'] = this.ticketAndRentalsImage;
    data['ticket_and_rentals_title'] = this.ticketAndRentalsTitle;
    data['ticket_and_rentals_description'] = this.ticketAndRentalsDescription;
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
