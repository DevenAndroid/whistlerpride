import 'package:get/get.dart';
import '../Repo/get_charity_ski_repo.dart';
import '../Repo/get_parade_comm_repo.dart';
import '../Repo/get_things_to_epo.dart';
import '../Repo/get_whistler_pride_events_repo.dart';
import '../Repo/guide_ski_repo.dart';
import '../Repo/youh_programming_repo.dart';
import '../model/charity_ski_model.dart';
import '../model/getPride_eat_model.dart';
import '../model/get_guide_ski_model.dart';
import '../model/get_pride_comm_model.dart';
import '../model/get_things_to_model.dart';
import '../model/get_whistler_pride_events_model.dart';
import '../model/youth_programming_model.dart';

class GetCharityRaceController extends GetxController{
  Rx<RxStatus> statusOfGetCharity = RxStatus.empty().obs;
  Rx<GetCharitySkiRaceModel> getCharityModel = GetCharitySkiRaceModel().obs;
  Rx<RxStatus> statusOfGetParade = RxStatus.empty().obs;
  Rx<GetParadeAndCommModel> getParadeModel = GetParadeAndCommModel().obs;
Rx<RxStatus> statusOfGetGuidePride = RxStatus.empty().obs;
  Rx<GetGuideSkiModel> getGuideSkiModel = GetGuideSkiModel().obs;

  Future getCharityRace() async {
    statusOfGetCharity.value = RxStatus.empty();
    await getCharitySkiRepo().then((value) {
      statusOfGetCharity.value = RxStatus.success();
      getCharityModel.value = value;
    });
  }

 Future getParade() async {
   statusOfGetParade.value = RxStatus.empty();
    await getParadeRepo().then((value) {
      statusOfGetParade.value = RxStatus.success();
      getParadeModel.value = value;
    });
  }

  Future getGuideSkiFun() async {
    statusOfGetGuidePride.value = RxStatus.empty();
    await getGuideSkiRepo().then((value) {
      statusOfGetGuidePride.value = RxStatus.success();
      getGuideSkiModel.value = value;
    });
  }


}