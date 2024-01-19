class ApiUrl {
  static const baseUrl = "https://whistlerpride.com//wp-json/api/whistler/";

  static const HomePageModel = "${baseUrl}get_home_data";
  static const FaqModel = "${baseUrl}get_faq_data";
  static const aboutModel = "${baseUrl}get_about_data";
  static const thefestivalModel = "${baseUrl}get_festival_data";
  static const getWhistlerEvents = "${baseUrl}get_whistler_pride_events";
  static const getYouthProgram = "${baseUrl}get_youth_programming";
  static const getThingsToDo = "${baseUrl}get_things_in_whistler";
  static const getPrideEat = "${baseUrl}get_whistler_pride_eats";
  static const getPrideCharity = "${baseUrl}get_charity_ski_race_data";
  static const getParadeUrl = "${baseUrl}get_parade_community_day";
  static const getcontactUSUrl = "${baseUrl}contact_us";
  static const postcontactUSUrl = "${baseUrl}send_mail_to_admin";
  static const AccommodationsModelUSUrl = "${baseUrl}get_accommodations";
}