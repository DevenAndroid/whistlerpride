import 'package:get/get.dart';
import '../Repo/get_things_to_epo.dart';
import '../Repo/get_whistler_pride_events_repo.dart';
import '../Repo/youh_programming_repo.dart';
import '../model/getPride_eat_model.dart';
import '../model/get_things_to_model.dart';
import '../model/get_whistler_pride_events_model.dart';
import '../model/youth_programming_model.dart';

class GetPrideEventsController extends GetxController{
  Rx<RxStatus> statusOfGetEvents = RxStatus.empty().obs;
  Rx<GetWhistlerPrideEventsModel> getPrideEventsModel = GetWhistlerPrideEventsModel().obs;
  Rx<RxStatus> statusOfGetYouthProgram = RxStatus.empty().obs;
  Rx<GetYouthProgrammingModel> getYouthProgramModel = GetYouthProgrammingModel().obs;
  Rx<RxStatus> statusOfGetThingsToDo = RxStatus.empty().obs;
  Rx<GetThingsToDoModel> getThingsToDoModel = GetThingsToDoModel().obs;
  Rx<RxStatus> statusOfGetPride = RxStatus.empty().obs;
  Rx<GetPrideEatModel> getGetPrideEatModel = GetPrideEatModel().obs;

  Future getPrideEvents() async {
    statusOfGetEvents.value = RxStatus.empty();
    await getPrideEventsRepo().then((value) {
      statusOfGetEvents.value = RxStatus.success();
      getPrideEventsModel.value = value;
    });
  }
  Future getYouthProgramming() async {
    statusOfGetYouthProgram.value = RxStatus.empty();
    await getYouthProgramRepo().then((value) {
      statusOfGetYouthProgram.value = RxStatus.success();
      getYouthProgramModel.value = value;
    });
  }

  Future getThingsToDo() async {
    statusOfGetThingsToDo.value = RxStatus.empty();
    await getThingsToDoRepo().then((value) {
      statusOfGetThingsToDo.value = RxStatus.success();
      getThingsToDoModel.value = value;
    });
  }

  Future getPrideEat() async {
    statusOfGetPride.value = RxStatus.empty();
    await getPrideEatRepo().then((value) {
      statusOfGetPride.value = RxStatus.success();
      getGetPrideEatModel.value = value;
    });
  }


}