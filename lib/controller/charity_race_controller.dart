import 'package:get/get.dart';
import '../Repo/get_charity_ski_repo.dart';
import '../Repo/get_things_to_epo.dart';
import '../Repo/get_whistler_pride_events_repo.dart';
import '../Repo/youh_programming_repo.dart';
import '../model/charity_ski_model.dart';
import '../model/getPride_eat_model.dart';
import '../model/get_things_to_model.dart';
import '../model/get_whistler_pride_events_model.dart';
import '../model/youth_programming_model.dart';

class GetCharityRaceController extends GetxController{
  Rx<RxStatus> statusOfGetCharity = RxStatus.empty().obs;
  Rx<GetCharitySkiRaceModel> getCharityModel = GetCharitySkiRaceModel().obs;

  Future getCharityRace() async {
    statusOfGetCharity.value = RxStatus.empty();
    await getCharitySkiRepo().then((value) {
      statusOfGetCharity.value = RxStatus.success();
      getCharityModel.value = value;
    });
  }


}