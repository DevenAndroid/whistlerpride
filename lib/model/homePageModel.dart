class HomePageModel {
  bool? status;
  String? message;
  Data? data;

  HomePageModel({this.status, this.message, this.data});

  HomePageModel.fromJson(Map<String, dynamic> json) {
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
  String? homeBanner;
  String? homeBannerTitle;
  String? homeBannerDescription;
  String? homeBannerFestivalDates;
  String? festivalCountdownMessage;
  List<FestivalMenu>? festivalMenu;
  List<AccommodationsMenu>? accommodationsMenu;
  List<FestivalCountdownList>? festivalCountdownList;
  List<FestivalPartners>? festivalPartners;

  Data(
      {this.homeBanner,
        this.homeBannerTitle,
        this.homeBannerDescription,
        this.homeBannerFestivalDates,
        this.festivalCountdownMessage,
        this.festivalMenu,
        this.accommodationsMenu,
        this.festivalCountdownList,
        this.festivalPartners});

  Data.fromJson(Map<String, dynamic> json) {
    homeBanner = json['home_banner'];
    homeBannerTitle = json['home_banner_title'];
    homeBannerDescription = json['home_banner_description'];
    homeBannerFestivalDates = json['home_banner_festival_dates'];
    festivalCountdownMessage = json['festival_countdown_message'];
    if (json['festival_menu'] != null) {
      festivalMenu = <FestivalMenu>[];
      json['festival_menu'].forEach((v) {
        festivalMenu!.add(new FestivalMenu.fromJson(v));
      });
    }
    if (json['accommodations_menu'] != null) {
      accommodationsMenu = <AccommodationsMenu>[];
      json['accommodations_menu'].forEach((v) {
        accommodationsMenu!.add(new AccommodationsMenu.fromJson(v));
      });
    }
    if (json['festival_countdown_list'] != null) {
      festivalCountdownList = <FestivalCountdownList>[];
      json['festival_countdown_list'].forEach((v) {
        festivalCountdownList!.add(new FestivalCountdownList.fromJson(v));
      });
    }
    if (json['festival_partners'] != null) {
      festivalPartners = <FestivalPartners>[];
      json['festival_partners'].forEach((v) {
        festivalPartners!.add(new FestivalPartners.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['home_banner'] = this.homeBanner;
    data['home_banner_title'] = this.homeBannerTitle;
    data['home_banner_description'] = this.homeBannerDescription;
    data['home_banner_festival_dates'] = this.homeBannerFestivalDates;
    data['festival_countdown_message'] = this.festivalCountdownMessage;
    if (this.festivalMenu != null) {
      data['festival_menu'] =
          this.festivalMenu!.map((v) => v.toJson()).toList();
    }
    if (this.accommodationsMenu != null) {
      data['accommodations_menu'] =
          this.accommodationsMenu!.map((v) => v.toJson()).toList();
    }
    if (this.festivalCountdownList != null) {
      data['festival_countdown_list'] =
          this.festivalCountdownList!.map((v) => v.toJson()).toList();
    }
    if (this.festivalPartners != null) {
      data['festival_partners'] =
          this.festivalPartners!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FestivalMenu {
  String? menuTitle;

  FestivalMenu({this.menuTitle});

  FestivalMenu.fromJson(Map<String, dynamic> json) {
    menuTitle = json['menu_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menu_title'] = this.menuTitle;
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

class FestivalCountdownList {
  String? festivalImage;
  String? festivalMessage;
  String? festivalButtonName;
  String? festivalButtonUrl;
  bool? isAnotherUrl;
  String? isPage;

  FestivalCountdownList(
      {this.festivalImage,
        this.festivalMessage,
        this.festivalButtonName,
        this.festivalButtonUrl,
        this.isAnotherUrl,
        this.isPage});

  FestivalCountdownList.fromJson(Map<String, dynamic> json) {
    festivalImage = json['festival_image'];
    festivalMessage = json['festival_message'];
    festivalButtonName = json['festival_button_name'];
    festivalButtonUrl = json['festival_button_url'];
    isAnotherUrl = json['is_another_url'];
    isPage = json['is_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['festival_image'] = this.festivalImage;
    data['festival_message'] = this.festivalMessage;
    data['festival_button_name'] = this.festivalButtonName;
    data['festival_button_url'] = this.festivalButtonUrl;
    data['is_another_url'] = this.isAnotherUrl;
    data['is_page'] = this.isPage;
    return data;
  }
}

class FestivalPartners {
  String? partnerImage;

  FestivalPartners({this.partnerImage});

  FestivalPartners.fromJson(Map<String, dynamic> json) {
    partnerImage = json['partner_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['partner_image'] = this.partnerImage;
    return data;
  }
}
