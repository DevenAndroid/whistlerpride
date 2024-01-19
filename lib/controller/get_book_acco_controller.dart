import 'package:get/get.dart';
import '../Repo/get_book_acco_repo.dart';
import '../model/get_book_acco_model.dart';

class GetBookAccoController extends GetxController{
  Rx<RxStatus> statusOfGetBookAcco = RxStatus.empty().obs;
  Rx<GetBookAccoModel> getBookAccoModel = GetBookAccoModel().obs;


  Future getBookAcco() async {
    statusOfGetBookAcco.value = RxStatus.empty();
    await getBookAccoRepo().then((value) {
      statusOfGetBookAcco.value = RxStatus.success();
      getBookAccoModel.value = value;
    });
  }
}