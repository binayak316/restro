import 'package:get/get.dart';
import 'package:restro_management_sys/core/model/order/my_orders_response_model.dart';

class OrderDetailController extends GetxController {
  Rxn<MyOrdersResponseModel> myOrderDetail = Rxn();

  @override
  void onInit() {
    var args = Get.arguments;
    if (args != null) {
      myOrderDetail.value = args['orderItem'];
    }
    super.onInit();
  }
}
