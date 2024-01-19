class GetBookAccoModel {
  bool? status;
  String? message;
  Data? data;

  GetBookAccoModel({this.status, this.message, this.data});

  GetBookAccoModel.fromJson(Map<String, dynamic> json) {
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
  String? bookAccommodationsTitle;
  String? bookAccommodationsBanner;
  PridePartneredDetails? pridePartneredDetails;
  BookAccommodationsDetails? bookAccommodationsDetails;
  String? preferToBookByPhone;
  SearchLodging? searchLodging;
  List<AccommodationsImageLists>? accommodationsImageLists;

  Data(
      {this.bookAccommodationsTitle,
        this.bookAccommodationsBanner,
        this.pridePartneredDetails,
        this.bookAccommodationsDetails,
        this.preferToBookByPhone,
        this.searchLodging,
        this.accommodationsImageLists});

  Data.fromJson(Map<String, dynamic> json) {
    bookAccommodationsTitle = json['book_accommodations_title'];
    bookAccommodationsBanner = json['book_accommodations_banner'];
    pridePartneredDetails = json['pride_partnered_details'] != null
        ? new PridePartneredDetails.fromJson(json['pride_partnered_details'])
        : null;
    bookAccommodationsDetails = json['book_accommodations_details'] != null
        ? new BookAccommodationsDetails.fromJson(
        json['book_accommodations_details'])
        : null;
    preferToBookByPhone = json['prefer_to_book_by_phone'];
    searchLodging = json['search_lodging'] != null
        ? new SearchLodging.fromJson(json['search_lodging'])
        : null;
    if (json['accommodations_image_lists'] != null) {
      accommodationsImageLists = <AccommodationsImageLists>[];
      json['accommodations_image_lists'].forEach((v) {
        accommodationsImageLists!.add(new AccommodationsImageLists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['book_accommodations_title'] = this.bookAccommodationsTitle;
    data['book_accommodations_banner'] = this.bookAccommodationsBanner;
    if (this.pridePartneredDetails != null) {
      data['pride_partnered_details'] = this.pridePartneredDetails!.toJson();
    }
    if (this.bookAccommodationsDetails != null) {
      data['book_accommodations_details'] =
          this.bookAccommodationsDetails!.toJson();
    }
    data['prefer_to_book_by_phone'] = this.preferToBookByPhone;
    if (this.searchLodging != null) {
      data['search_lodging'] = this.searchLodging!.toJson();
    }
    if (this.accommodationsImageLists != null) {
      data['accommodations_image_lists'] =
          this.accommodationsImageLists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PridePartneredDetails {
  String? pridePartneredImage;
  String? pridePartneredTitle;
  String? pridePartneredSubtitle;
  String? pridePartneredDescription;

  PridePartneredDetails(
      {this.pridePartneredImage,
        this.pridePartneredTitle,
        this.pridePartneredSubtitle,
        this.pridePartneredDescription});

  PridePartneredDetails.fromJson(Map<String, dynamic> json) {
    pridePartneredImage = json['pride_partnered_image'];
    pridePartneredTitle = json['pride_partnered_title'];
    pridePartneredSubtitle = json['pride_partnered_subtitle'];
    pridePartneredDescription = json['pride_partnered_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pride_partnered_image'] = this.pridePartneredImage;
    data['pride_partnered_title'] = this.pridePartneredTitle;
    data['pride_partnered_subtitle'] = this.pridePartneredSubtitle;
    data['pride_partnered_description'] = this.pridePartneredDescription;
    return data;
  }
}

class BookAccommodationsDetails {
  String? accommodationsTitle;
  String? accommodationsDescription;

  BookAccommodationsDetails(
      {this.accommodationsTitle, this.accommodationsDescription});

  BookAccommodationsDetails.fromJson(Map<String, dynamic> json) {
    accommodationsTitle = json['accommodations_title'];
    accommodationsDescription = json['accommodations_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accommodations_title'] = this.accommodationsTitle;
    data['accommodations_description'] = this.accommodationsDescription;
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

class AccommodationsImageLists {
  String? accommodationsImage;
  String? accommodationsImageUrl;
  bool? isAnotherUrl;
  String? isPage;

  AccommodationsImageLists(
      {this.accommodationsImage,
        this.accommodationsImageUrl,
        this.isAnotherUrl,
        this.isPage});

  AccommodationsImageLists.fromJson(Map<String, dynamic> json) {
    accommodationsImage = json['accommodations_image'];
    accommodationsImageUrl = json['accommodations_image_url'];
    isAnotherUrl = json['is_another_url'];
    isPage = json['is_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accommodations_image'] = this.accommodationsImage;
    data['accommodations_image_url'] = this.accommodationsImageUrl;
    data['is_another_url'] = this.isAnotherUrl;
    data['is_page'] = this.isPage;
    return data;
  }
}
