import 'package:get/get.dart';

class LoginWidgetController extends GetxController {
  /// Responsible for showing the validating status of the user and disabling the button till the
  /// api request is firing. It will again enable button after the completion of the api request.
  RxBool isLoading = false.obs;

  updateIsLoading() {
    isLoading.value = !isLoading.value;
  }
}