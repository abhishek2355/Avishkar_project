import 'package:avishkar/Screen/Authentication/Wrapper/authentication_wrapper.dart';
import 'package:get/get.dart';

class SignupWidgetController extends GetxController {
  /// Responsible for showing the validating status of the user and disabling the button till the
  /// api request is firing. It will again enable button after the completion of the api request.
  RxBool isLoading = false.obs;

  updateIsLoading() {
    isLoading.value = !isLoading.value;
  }

  // For show mobile number text
  RxBool isShowMobileLabelText = false.obs;
  RxString wrapperLabelText = ''.obs;

  // Update mobile number text
  makeIsShowMobileTextFormFieldLabelTextTrue() => isShowMobileLabelText.value = true;

  updateWrapperLabelText(AuthenticationWrapper wrapper, TextFormFieldType formFieldType) {
    wrapperLabelText.value = wrapper.getLabelText(formFieldType: formFieldType);
  }

}