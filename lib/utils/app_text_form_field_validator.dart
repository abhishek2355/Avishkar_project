import 'package:email_validator/email_validator.dart';
import 'package:avishkar/Screen/Authentication/Wrapper/authentication_wrapper.dart';
import 'package:avishkar/Constants/app_strings.dart' as app_strings;

// Mail validator
class AlphaTextFormFieldValidatorUtilities {
  static String? emailValidator(String mail) {
    if (mail.isEmpty) {
      return app_strings.emptyMailErrorMessage;
    } else if (!EmailValidator.validate(mail)) {
      return app_strings.invalidMailErrorMessage;
    } else {
      return null;
    }
  }

  // Phone number validator
  static String? mobileValidator(String mobile) {
    final phoneRegExp = RegExp(r'^(?:[+0][1-9])?[0-9]{10}');
    if (mobile.isEmpty) {
      return app_strings.emptyMobileErrorMessage;
    } else if (!phoneRegExp.hasMatch(mobile)) {
      return app_strings.invalidMobileErrorMessage;
    } else {
      return null;
    }
  }

  // name validator
  static String? userNameValidator(String name) {
    if (name.isEmpty) {
      return app_strings.emptyUserNameErrorMessage;
    } else if (name.contains(' ')) {
      return app_strings.invalidUserNameErrorMessage;
    } else if (name.length < 4 || name.length > 12){
      return app_strings.invalidUserNameSizeErrorMessage;
    }
    else {
      return null;
    }
  }

  // password validator
  static String? passwordValidator(String password) {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])');
    if (password.isEmpty) {
      return app_strings.emptyPasswordErrorMessage;
    } else {
      if (!regex.hasMatch(password)) {
        return app_strings.invalidPasswordErrorMessage;
      } else {
        return null;
      }
    }
  }

// Validator method

  static String? GlobalValidator({String? validatorValue, required TextFormFieldType formFieldType, required AuthenticationWrapper wrapper}) {
    String? validationMsg;
    String validTextFormFieldMessage = getValidTextFormFieldMessage(formFieldType: formFieldType);
    if (validatorValue == null) {
      setFormFieldlabelText(formFieldType: formFieldType, wrapper: wrapper, labelText: null);
    } else {
      validationMsg = applyValidatorAndGetResult(formFieldType: formFieldType, validatorValue: validatorValue);
      validationMsg = (validationMsg != null) ? validationMsg : validTextFormFieldMessage;
    }
    if (validationMsg == validTextFormFieldMessage) {
      setFormFieldlabelText(formFieldType: formFieldType, wrapper: wrapper, labelText: validTextFormFieldMessage);
      setIsValid(formFieldType: formFieldType, wrapper: wrapper, isValid: true);
      return null;
    } else {
      setFormFieldlabelText(formFieldType: formFieldType, wrapper: wrapper, labelText: validationMsg);
      setIsValid(formFieldType: formFieldType, wrapper: wrapper, isValid: false);
      return '';
    }
  }

  static void setFormFieldlabelText({required TextFormFieldType formFieldType, required AuthenticationWrapper wrapper, required String? labelText}) {
    switch (formFieldType) {
      case TextFormFieldType.signupMail:
      case TextFormFieldType.loginMail:
      case TextFormFieldType.resetPasswordMail:
        wrapper.emailLabelText = (labelText != null) ? labelText : app_strings.emptyMailErrorMessage;
        break;
      case TextFormFieldType.signupMobile:
        wrapper.mobileLabelText = (labelText != null) ? labelText : app_strings.emptyMobileErrorMessage;
        break;
      case TextFormFieldType.signupUserName:
        wrapper.nameLabelText = (labelText != null) ? labelText : app_strings.emptyUserNameErrorMessage;
        break;
      case TextFormFieldType.signupPassword:
      case TextFormFieldType.loginPassword:
        wrapper.passwordLabelText = (labelText != null) ? labelText : app_strings.emptyPasswordErrorMessage;
        break;
      case TextFormFieldType.confirmPassword:
        wrapper.confirmPasswordLabelText = (labelText != null) ? labelText : app_strings.emptyPasswordErrorMessage;
        break;
    }
  }

  static void setIsValid({required TextFormFieldType formFieldType, required AuthenticationWrapper wrapper, required bool isValid}) {
    switch (formFieldType) {
      case TextFormFieldType.signupMail:
      case TextFormFieldType.loginMail:
      case TextFormFieldType.resetPasswordMail:
        wrapper.isValidEmail = isValid;
        break;
      case TextFormFieldType.signupMobile:
        wrapper.isValidMobile = isValid;
        break;
      case TextFormFieldType.signupUserName:
        wrapper.isValidUserName = isValid;
        break;
      case TextFormFieldType.signupPassword:
      case TextFormFieldType.loginPassword:
        wrapper.isValidPassword = isValid;
        break;
      case TextFormFieldType.confirmPassword:
        wrapper.isValidConfirmPassword = isValid;
        break;
    }
  }

  static String? applyValidatorAndGetResult({required TextFormFieldType formFieldType, required String validatorValue}) {
    switch (formFieldType) {
      case TextFormFieldType.signupMail:
      case TextFormFieldType.loginMail:
      case TextFormFieldType.resetPasswordMail:
        return AlphaTextFormFieldValidatorUtilities.emailValidator(validatorValue);
      case TextFormFieldType.signupMobile:
        return AlphaTextFormFieldValidatorUtilities.mobileValidator(validatorValue);
      case TextFormFieldType.signupUserName:
        return AlphaTextFormFieldValidatorUtilities.userNameValidator(validatorValue);
      case TextFormFieldType.signupPassword:
      case TextFormFieldType.loginPassword:
      case TextFormFieldType.confirmPassword:
        return AlphaTextFormFieldValidatorUtilities.passwordValidator(validatorValue);
    }
  }

  static String getValidTextFormFieldMessage({required TextFormFieldType formFieldType}) {
    switch (formFieldType) {
      case TextFormFieldType.signupMail:
      case TextFormFieldType.loginMail:
      case TextFormFieldType.resetPasswordMail:
        return app_strings.validMailMessage;
      case TextFormFieldType.signupMobile:
        return app_strings.validMobileMessage;
      case TextFormFieldType.signupUserName:
        return app_strings.validUserNameMessage;
      case TextFormFieldType.signupPassword:
      case TextFormFieldType.loginPassword:
      case TextFormFieldType.confirmPassword:
        return app_strings.validPasswordMessage;
    }
  }
}
