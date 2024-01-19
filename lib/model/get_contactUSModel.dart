class GetContactUsModel {
  bool? status;
  String? message;
  Data? data;

  GetContactUsModel({this.status, this.message, this.data});

  GetContactUsModel.fromJson(Map<String, dynamic> json) {
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
  String? contactTitle;
  String? contactDescription;

  Data({this.contactTitle, this.contactDescription});

  Data.fromJson(Map<String, dynamic> json) {
    contactTitle = json['contact_title'];
    contactDescription = json['contact_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contact_title'] = this.contactTitle;
    data['contact_description'] = this.contactDescription;
    return data;
  }
}
