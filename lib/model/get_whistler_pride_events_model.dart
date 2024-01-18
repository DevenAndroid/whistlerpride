import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetWhistlerPrideEventsModel {
  bool? status;
  dynamic message;
  Data? data;

  GetWhistlerPrideEventsModel({this.status, this.message, this.data});

  GetWhistlerPrideEventsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  dynamic whistlerTitle;
  dynamic whistlerBanner;
  List<EventsTicketsLists>? eventsTicketsLists;
  List<EventScheduleLists>? eventScheduleLists;
  List<EventPlace>? eventLatLong;

  Data(
      {this.whistlerTitle,
        this.whistlerBanner,
        this.eventsTicketsLists,
        this.eventScheduleLists,
        this.eventLatLong});

  Data.fromJson(Map<String, dynamic> json) {
    whistlerTitle = json['whistler_title'];
    whistlerBanner = json['whistler_banner'];
    if (json['events_tickets_lists'] != null) {
      eventsTicketsLists = <EventsTicketsLists>[];
      json['events_tickets_lists'].forEach((v) {
        eventsTicketsLists!.add(EventsTicketsLists.fromJson(v));
      });
    }
    if (json['event_schedule_lists'] != null) {
      eventScheduleLists = <EventScheduleLists>[];

      print("Parsing.......     ${json['event_schedule_lists']}");
      json['event_schedule_lists'].forEach((v) {
        eventScheduleLists!.add(EventScheduleLists.fromJson(v));
      });
    }
    if (json['event_lat_long'] != null) {
      eventLatLong = <EventPlace>[];
      json['event_lat_long'].forEach((v) {
        eventLatLong!.add(EventPlace.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['whistler_title'] = this.whistlerTitle;
    data['whistler_banner'] = this.whistlerBanner;
    if (this.eventsTicketsLists != null) {
      data['events_tickets_lists'] =
          this.eventsTicketsLists!.map((v) => v.toJson()).toList();
    }
    if (this.eventScheduleLists != null) {
      data['event_schedule_lists'] =
          this.eventScheduleLists!.map((v) => v.toJson()).toList();
    }
    if (this.eventLatLong != null) {
      data['event_lat_long'] =
          this.eventLatLong!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EventsTicketsLists {
  dynamic eventTicketImage;
  dynamic eventTicketButtonName;
  dynamic eventTicketButtonUrl;
  bool? isAnotherUrl;

  EventsTicketsLists(
      {this.eventTicketImage,
        this.eventTicketButtonName,
        this.eventTicketButtonUrl,
        this.isAnotherUrl});

  EventsTicketsLists.fromJson(Map<String, dynamic> json) {
    eventTicketImage = json['event_ticket_image'];
    eventTicketButtonName = json['event_ticket_button_name'];
    eventTicketButtonUrl = json['event_ticket_button_url'];
    isAnotherUrl = json['is_another_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['event_ticket_image'] = this.eventTicketImage;
    data['event_ticket_button_name'] = this.eventTicketButtonName;
    data['event_ticket_button_url'] = this.eventTicketButtonUrl;
    data['is_another_url'] = this.isAnotherUrl;
    return data;
  }
}

class EventScheduleLists {
  dynamic eventImage;
  dynamic eventsBookLink;
  dynamic eventTitle;
  dynamic eventDate;
  dynamic eventTime;
  dynamic eventDescription;
  dynamic eventPresentedBy;
  dynamic eventPresentedMessage;
  dynamic eventAgeGroup;
  dynamic ageDocumentationMessage;
  EventPlace? eventPlace;
  bool? isAnotherUrl;

  EventScheduleLists(
      {this.eventImage,
        this.eventsBookLink,
        this.eventTitle,
        this.eventDate,
        this.eventTime,
        this.eventDescription,
        this.eventPresentedBy,
        this.eventPresentedMessage,
        this.eventAgeGroup,
        this.ageDocumentationMessage,
        this.eventPlace,
        this.isAnotherUrl});

  EventScheduleLists.fromJson(Map<String, dynamic> json) {
    eventImage = json['event_image'];
    eventsBookLink = json['events_book_link'];
    eventTitle = json['event_title'];
    eventDate = json['event_date'];
    eventTime = json['event_time'];
    eventDescription = json['event_description'];
    eventPresentedBy = json['event_presented_by'];
    eventPresentedMessage = json['event_presented_message'];
    eventAgeGroup = json['event_age_group'];
    ageDocumentationMessage = json['age_documentation_message'];
    eventPlace = json['event_place'] != null
        ? new EventPlace.fromJson(json['event_place'])
        : null;
    isAnotherUrl = json['is_another_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_image'] = this.eventImage;
    data['events_book_link'] = this.eventsBookLink;
    data['event_title'] = this.eventTitle;
    data['event_date'] = this.eventDate;
    data['event_time'] = this.eventTime;
    data['event_description'] = this.eventDescription;
    data['event_presented_by'] = this.eventPresentedBy;
    data['event_presented_message'] = this.eventPresentedMessage;
    data['event_age_group'] = this.eventAgeGroup;
    data['age_documentation_message'] = this.ageDocumentationMessage;
    if (this.eventPlace != null) {
      data['event_place'] = this.eventPlace!.toJson();
    }
    data['is_another_url'] = this.isAnotherUrl;
    return data;
  }
}

class EventPlace {
  dynamic eventTitle;
  dynamic latitude;
  dynamic longitude;
  LatLng? latLong;

  EventPlace({this.latitude, this.longitude,this.eventTitle});

  EventPlace.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    eventTitle = json['event_title'];
    longitude = json['longitude'];
    latLong = LatLng(double.tryParse(latitude.toString()) ?? 0, double.tryParse(longitude.toString()) ?? 0);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['event_title'] = this.eventTitle;
    return data;
  }
}
