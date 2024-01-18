class GetCharitySkiRaceModel {
  bool? status;
  String? message;
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
  String? charityTitle;
  String? charityBanner;
  String? s2024WelcomingTitle;
  String? s2024WelcomingDescription;
  String? s2024CompanyTitle;
  String? s2024CompanyDescription;
  String? s2024CompanyLogo;
  String? s2023WelcomingTitle;
  String? s2023WelcomingDescription;
  String? s2023CompanyTitle;
  String? s2023CompanyDescription;
  String? s2023CompanyLogo;
  String? promoBtnText;
  String? promoBtnUrl;

  Data(
      {this.charityTitle,
        this.charityBanner,
        this.s2024WelcomingTitle,
        this.s2024WelcomingDescription,
        this.s2024CompanyTitle,
        this.s2024CompanyDescription,
        this.s2024CompanyLogo,
        this.s2023WelcomingTitle,
        this.s2023WelcomingDescription,
        this.s2023CompanyTitle,
        this.s2023CompanyDescription,
        this.s2023CompanyLogo,
        this.promoBtnText,
        this.promoBtnUrl});

  Data.fromJson(Map<String, dynamic> json) {
    charityTitle = json['charity_title'];
    charityBanner = json['charity_banner'];
    s2024WelcomingTitle = json['2024_welcoming_title'];
    s2024WelcomingDescription = json['2024_welcoming_description'];
    s2024CompanyTitle = json['2024_company_title'];
    s2024CompanyDescription = json['2024_company_description'];
    s2024CompanyLogo = json['2024_company_logo'];
    s2023WelcomingTitle = json['2023_welcoming_title'];
    s2023WelcomingDescription = json['2023_welcoming_description'];
    s2023CompanyTitle = json['2023_company_title'];
    s2023CompanyDescription = json['2023_company_description'];
    s2023CompanyLogo = json['2023_company_logo'];
    promoBtnText = json['promo_btn_text'];
    promoBtnUrl = json['promo_btn_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['charity_title'] = this.charityTitle;
    data['charity_banner'] = this.charityBanner;
    data['2024_welcoming_title'] = this.s2024WelcomingTitle;
    data['2024_welcoming_description'] = this.s2024WelcomingDescription;
    data['2024_company_title'] = this.s2024CompanyTitle;
    data['2024_company_description'] = this.s2024CompanyDescription;
    data['2024_company_logo'] = this.s2024CompanyLogo;
    data['2023_welcoming_title'] = this.s2023WelcomingTitle;
    data['2023_welcoming_description'] = this.s2023WelcomingDescription;
    data['2023_company_title'] = this.s2023CompanyTitle;
    data['2023_company_description'] = this.s2023CompanyDescription;
    data['2023_company_logo'] = this.s2023CompanyLogo;
    data['promo_btn_text'] = this.promoBtnText;
    data['promo_btn_url'] = this.promoBtnUrl;
    return data;
  }
}
