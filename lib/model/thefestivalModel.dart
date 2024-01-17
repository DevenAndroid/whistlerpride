class TheFestivalModel {
  bool? status;
  String? message;
  Data? data;

  TheFestivalModel({this.status, this.message, this.data});

  TheFestivalModel.fromJson(Map<String, dynamic> json) {
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
  String? festivalTitle;
  String? festivalDate;
  List<FestivalLists>? festivalLists;
  List<FestivalMenu>? festivalMenu;

  Data(
      {this.festivalTitle,
        this.festivalDate,
        this.festivalLists,
        this.festivalMenu});

  Data.fromJson(Map<String, dynamic> json) {
    festivalTitle = json['festival_title'];
    festivalDate = json['festival_date'];
    if (json['festival_lists'] != null) {
      festivalLists = <FestivalLists>[];
      json['festival_lists'].forEach((v) {
        festivalLists!.add(new FestivalLists.fromJson(v));
      });
    }
    if (json['festival_menu'] != null) {
      festivalMenu = <FestivalMenu>[];
      json['festival_menu'].forEach((v) {
        festivalMenu!.add(new FestivalMenu.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['festival_title'] = this.festivalTitle;
    data['festival_date'] = this.festivalDate;
    if (this.festivalLists != null) {
      data['festival_lists'] =
          this.festivalLists!.map((v) => v.toJson()).toList();
    }
    if (this.festivalMenu != null) {
      data['festival_menu'] =
          this.festivalMenu!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FestivalLists {
  String? festivalImage;
  String? festivalTitle;
  String? festivalMessage;
  String? festivalButtonName;
  String? festivalButtonUrl;
  String? isPage;

  FestivalLists(
      {this.festivalImage,
        this.festivalTitle,
        this.festivalMessage,
        this.festivalButtonName,
        this.festivalButtonUrl,
        this.isPage});

  FestivalLists.fromJson(Map<String, dynamic> json) {
    festivalImage = json['festival_image'];
    festivalTitle = json['festival_title'];
    festivalMessage = json['festival_message'];
    festivalButtonName = json['festival_button_name'];
    festivalButtonUrl = json['festival_button_url'];
    isPage = json['is_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['festival_image'] = this.festivalImage;
    data['festival_title'] = this.festivalTitle;
    data['festival_message'] = this.festivalMessage;
    data['festival_button_name'] = this.festivalButtonName;
    data['festival_button_url'] = this.festivalButtonUrl;
    data['is_page'] = this.isPage;
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
