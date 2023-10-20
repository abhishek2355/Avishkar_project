import 'package:avishkar/Screen/Authentication/Wrapper/authentication_wrapper.dart';
import 'package:get/get.dart';

class AlphaSizedBoxOfTextFormFieldController extends GetxController {
  RxBool isShowTextFormFieldLabelText = false.obs;
  RxBool isObscure = false.obs;
  RxString wrapperLabelText = ''.obs;

  makeIsShowTextFormFieldLabelTextTrue() => isShowTextFormFieldLabelText.value = true;

  changeIsObscure() {
    isObscure.value = (isObscure.value) ? false : true;
  }

  updateWrapperLabelText(AuthenticationWrapper wrapper, TextFormFieldType formFieldType) {
    wrapperLabelText.value = wrapper.getLabelText(formFieldType: formFieldType);
  }
}