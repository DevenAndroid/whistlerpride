
import 'package:get/get.dart';

import '../Repo/get_whistler_pride_events_repo.dart';
import '../model/get_whistler_pride_events_model.dart';

class GetPrideEventsController extends GetxController{
  Rx<RxStatus> statusOfGetEvents = RxStatus.empty().obs;
  Rx<GetWhistlerPrideEventsModel> getPrideEventsModel = GetWhistlerPrideEventsModel().obs;

  getPrideEvents(){
    statusOfGetEvents.value = RxStatus.empty();
    getPrideEventsRepo().then((value) {
      statusOfGetEvents.value = RxStatus.success();
      getPrideEventsModel.value = value;
    });
  }
}