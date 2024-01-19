class AccommodationsModel {
  bool? status;
  String? message;
  Data? data;

  AccommodationsModel({this.status, this.message, this.data});

  AccommodationsModel.fromJson(Map<String, dynamic> json) {
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
  String? accommodationsTitle;
  String? accommodationsBanner;
  HotelPackageDetails? hotelPackageDetails;
  WhistlerLodgingDetails? whistlerLodgingDetails;
  String? preferToBookByPhone;
  SearchLodging? searchLodging;
  List<AccommodationsMenu>? accommodationsMenu;

  Data(
      {this.accommodationsTitle,
        this.accommodationsBanner,
        this.hotelPackageDetails,
        this.whistlerLodgingDetails,
        this.preferToBookByPhone,
        this.searchLodging,
        this.accommodationsMenu});

  Data.fromJson(Map<String, dynamic> json) {
    accommodationsTitle = json['accommodations_title'];
    accommodationsBanner = json['accommodations_banner'];
    hotelPackageDetails = json['hotel_package_details'] != null
        ? new HotelPackageDetails.fromJson(json['hotel_package_details'])
        : null;
    whistlerLodgingDetails = json['whistler_lodging_details'] != null
        ? new WhistlerLodgingDetails.fromJson(json['whistler_lodging_details'])
        : null;
    preferToBookByPhone = json['prefer_to_book_by_phone'];
    searchLodging = json['search_lodging'] != null
        ? new SearchLodging.fromJson(json['search_lodging'])
        : null;
    if (json['accommodations_menu'] != null) {
      accommodationsMenu = <AccommodationsMenu>[];
      json['accommodations_menu'].forEach((v) {
        accommodationsMenu!.add(new AccommodationsMenu.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accommodations_title'] = this.accommodationsTitle;
    data['accommodations_banner'] = this.accommodationsBanner;
    if (this.hotelPackageDetails != null) {
      data['hotel_package_details'] = this.hotelPackageDetails!.toJson();
    }
    if (this.whistlerLodgingDetails != null) {
      data['whistler_lodging_details'] = this.whistlerLodgingDetails!.toJson();
    }
    data['prefer_to_book_by_phone'] = this.preferToBookByPhone;
    if (this.searchLodging != null) {
      data['search_lodging'] = this.searchLodging!.toJson();
    }
    if (this.accommodationsMenu != null) {
      data['accommodations_menu'] =
          this.accommodationsMenu!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HotelPackageDetails {
  String? packageImage;
  String? packageDescription;
  String? packageButtonName;
  String? packageButtonUrl;
  bool? isAnotherUrl;

  HotelPackageDetails(
      {this.packageImage,
        this.packageDescription,
        this.packageButtonName,
        this.packageButtonUrl,
        this.isAnotherUrl});

  HotelPackageDetails.fromJson(Map<String, dynamic> json) {
    packageImage = json['package_image'];
    packageDescription = json['package_description'];
    packageButtonName = json['package_button_name'];
    packageButtonUrl = json['package_button_url'];
    isAnotherUrl = json['is_another_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['package_image'] = this.packageImage;
    data['package_description'] = this.packageDescription;
    data['package_button_name'] = this.packageButtonName;
    data['package_button_url'] = this.packageButtonUrl;
    data['is_another_url'] = this.isAnotherUrl;
    return data;
  }
}

class WhistlerLodgingDetails {
  String? lodgingTitle;
  String? lodgingDescription;

  WhistlerLodgingDetails({this.lodgingTitle, this.lodgingDescription});

  WhistlerLodgingDetails.fromJson(Map<String, dynamic> json) {
    lodgingTitle = json['lodging_title'];
    lodgingDescription = json['lodging_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lodging_title'] = this.lodgingTitle;
    data['lodging_description'] = this.lodgingDescription;
    return data;
  }
}

class SearchLodging {
  String? searchUrl;
  String? arrivaldate;
  String? departuredate;
  bool? isAnotherUrl;

  SearchLodging(
      {this.searchUrl,
        this.arrivaldate,
        this.departuredate,
        this.isAnotherUrl});

  SearchLodging.fromJson(Map<String, dynamic> json) {
    searchUrl = json['search_url'];
    arrivaldate = json['arrivaldate'];
    departuredate = json['departuredate'];
    isAnotherUrl = json['is_another_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['search_url'] = this.searchUrl;
    data['arrivaldate'] = this.arrivaldate;
    data['departuredate'] = this.departuredate;
    data['is_another_url'] = this.isAnotherUrl;
    return data;
  }
}

class AccommodationsMenu {
  String? menuTitle;

  AccommodationsMenu({this.menuTitle});

  AccommodationsMenu.fromJson(Map<String, dynamic> json) {
    menuTitle = json['menu_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menu_title'] = this.menuTitle;
    return data;
  }
}
