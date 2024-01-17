class FaqModel {
  bool? status;
  String? message;
  Data? data;

  FaqModel({this.status, this.message, this.data});

  FaqModel.fromJson(Map<String, dynamic> json) {
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
  String? faqTitle;
  String? faqContent;
  String? faqBanner;
  List<FaqTabContent>? faqTabContent;

  Data({this.faqTitle, this.faqContent, this.faqBanner, this.faqTabContent});

  Data.fromJson(Map<String, dynamic> json) {
    faqTitle = json['faq_title'];
    faqContent = json['faq_content'];
    faqBanner = json['faq_banner'];
    if (json['faq_tab_content'] != null) {
      faqTabContent = <FaqTabContent>[];
      json['faq_tab_content'].forEach((v) {
        faqTabContent!.add(new FaqTabContent.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['faq_title'] = this.faqTitle;
    data['faq_content'] = this.faqContent;
    data['faq_banner'] = this.faqBanner;
    if (this.faqTabContent != null) {
      data['faq_tab_content'] =
          this.faqTabContent!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FaqTabContent {
  String? questions;
  String? answered;

  FaqTabContent({this.questions, this.answered});

  FaqTabContent.fromJson(Map<String, dynamic> json) {
    questions = json['questions'];
    answered = json['answered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questions'] = this.questions;
    data['answered'] = this.answered;
    return data;
  }
}
