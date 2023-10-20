import 'package:get/get.dart';

class LoginOrSignUpWidgetController extends GetxController {
  /// Responsible for showing the validating status of the user and disabling the button till the
  /// api request is firing. It will again enable button after the completion of the api request.
  RxBool islogin = true.obs;

  updateIsLogin() {
    islogin.value = !islogin.value;
  }
}