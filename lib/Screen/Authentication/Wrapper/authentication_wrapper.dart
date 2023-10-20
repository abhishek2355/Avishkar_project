import 'package:avishkar/Constants/app_strings.dart' as app_strings;
// TextFormField Enums

enum TextFormFieldType { signupMail, signupMobile, signupUserName, signupPassword, loginMail, loginPassword, resetPasswordMail, confirmPassword }

// Wrapper class

class AuthenticationWrapper {
  late String emailLabelText;
  late bool isValidEmail;
  late String mobileLabelText;
  late bool isValidMobile;
  late String nameLabelText;
  late bool isValidUserName;
  late String passwordLabelText;
  late bool isValidPassword;
  late String confirmPasswordLabelText;
  late bool isValidConfirmPassword;

  AuthenticationWrapper.signup(
      {this.emailLabelText = app_strings.signupPageMailTextFormFieldLable,
      this.isValidEmail = false,
      this.mobileLabelText = app_strings.signupPageMobileTextFormFieldLable,
      this.isValidMobile = false,
      this.nameLabelText = app_strings.signupPageNameTextFormFieldLable,
      this.isValidUserName = false,
      this.passwordLabelText = app_strings.signupPagePasswordTextFormFieldLable,
      this.isValidPassword = false});

  AuthenticationWrapper.login(
      {this.emailLabelText = app_strings.loginPageMailTextFormFieldLable,
      this.isValidEmail = false,
      this.passwordLabelText = app_strings.loginPagePasswordTextFormFieldLable,
      this.isValidPassword = false});

  AuthenticationWrapper.forgotPassword({this.emailLabelText = app_strings.forgotPageMailTextFormFieldLable, this.isValidEmail = false});

  AuthenticationWrapper.resetPassword(
      {this.passwordLabelText = app_strings.resetPageNewPasswordTextFormFieldLabel,
      this.isValidPassword = false,
      this.confirmPasswordLabelText = app_strings.resetPageConfirmPasswordTextFormFieldLabel,
      this.isValidConfirmPassword = false});

  bool getIsValid({required TextFormFieldType formFieldType}) {
    switch (formFieldType) {
      case TextFormFieldType.signupMail:
      case TextFormFieldType.loginMail:
      case TextFormFieldType.resetPasswordMail:
        return isValidEmail;
      case TextFormFieldType.signupMobile:
        return isValidMobile;
      case TextFormFieldType.signupUserName:
        return isValidUserName;
      case TextFormFieldType.signupPassword:
      case TextFormFieldType.loginPassword:
        return isValidPassword;
      case TextFormFieldType.confirmPassword:
        return isValidConfirmPassword;
    }
  }

  String getLabelText({required TextFormFieldType formFieldType}) {
    switch (formFieldType) {
      case TextFormFieldType.signupMail:
      case TextFormFieldType.loginMail:
      case TextFormFieldType.resetPasswordMail:
        return emailLabelText;
      case TextFormFieldType.signupMobile:
        return mobileLabelText;
      case TextFormFieldType.signupUserName:
        return nameLabelText;
      case TextFormFieldType.signupPassword:
      case TextFormFieldType.loginPassword:
        return passwordLabelText;
      case TextFormFieldType.confirmPassword:
        return confirmPasswordLabelText;
    }
  }
}
