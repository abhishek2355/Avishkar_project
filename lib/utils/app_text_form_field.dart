
import 'package:avishkar/Screen/Authentication/Wrapper/authentication_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;
import 'package:avishkar/Constants/app_font_sizes.dart' as app_font_sizes;
import 'package:avishkar/utils/app_text_form_field_validator.dart';
import 'package:avishkar/utils/app_text_form_field_controller.dart';
import 'package:get/get.dart';

class AlphaSizedBoxOfTextFormFieldWidget extends StatefulWidget {
  const AlphaSizedBoxOfTextFormFieldWidget({
    Key? key,
    this.initialValue,
    required this.prefixIcon,
    this.isSuffixIcon = false,
    this.isShowTextFormFieldotpPage = true,
    required this.hintText,
    required this.textFormFieldType,
    required this.wrapper,
    required this.textFormFieldValidationKey,
    required this.screenHeight,
    required this.screenWidth,
    required this.onSaved,
  }) : super(key: key);

  final IconData prefixIcon;
  final bool isSuffixIcon;
  final String hintText;
  final TextFormFieldType textFormFieldType;
  final AuthenticationWrapper wrapper;
  final bool isShowTextFormFieldLabelText = false;
  final bool isShowTextFormFieldotpPage;
  final GlobalKey<FormFieldState> textFormFieldValidationKey;
  final double screenHeight;
  final double screenWidth;
  final void Function(String?)? onSaved;
  final String? initialValue;

  @override
  State<AlphaSizedBoxOfTextFormFieldWidget> createState() => _SizedBoxOfTextFormFieldState();
  
}

class _SizedBoxOfTextFormFieldState extends State<AlphaSizedBoxOfTextFormFieldWidget> {
  late AlphaSizedBoxOfTextFormFieldController _controller;
  Color labelTextColor = Colors.black;
  Color enabledBorderColor = Colors.black;
  Color focusedBorderColor = Colors.black;

  @override
  void initState() {
    super.initState();
    _controller = AlphaSizedBoxOfTextFormFieldController();
    if (widget.isSuffixIcon) {
      _controller.changeIsObscure();
    }
    updateLabelTextColor();
    _controller.updateWrapperLabelText(widget.wrapper, widget.textFormFieldType);
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed
    _controller.dispose();
    super.dispose();
  }
      
  
  updateLabelTextColor() {
    if (!_controller.isShowTextFormFieldLabelText.value) {
      labelTextColor = Colors.black54;
    } else if (!widget.wrapper.getIsValid(formFieldType: widget.textFormFieldType)) {
      labelTextColor = Colors.red;
    } else {
      labelTextColor = Colors.green;
    }
    enabledBorderColor = widget.wrapper.getIsValid(formFieldType: widget.textFormFieldType) ? Colors.green : Colors.black;
    focusedBorderColor = widget.wrapper.getIsValid(formFieldType: widget.textFormFieldType) ? Colors.green : Colors.blue.shade500;

  }

  @override
  Widget build(BuildContext context) {

    final suffix = widget.isSuffixIcon
      ? InkWell(
          child: Obx(() {
            return Icon(
              _controller.isObscure.value ? Icons.visibility : Icons.visibility_off,
              size: widget.screenHeight * app_heights.height25,
            );
          },),
          onTap: () {
            _controller.changeIsObscure();
          },
        )
      : null;

    //
    if (widget.isShowTextFormFieldotpPage == false) {
      return const SizedBox(
        height: null,
      );
    }

      return SizedBox(
        height: widget.screenHeight * app_heights.height59,
        child: Obx(() {
          
        return TextFormField(
          initialValue: widget.initialValue,
          obscureText: _controller.isObscure.value,
          decoration: InputDecoration(
                errorStyle: TextStyle(height: widget.screenHeight * app_heights.height0),
                floatingLabelBehavior: _controller.isShowTextFormFieldLabelText.value ? FloatingLabelBehavior.always : FloatingLabelBehavior.auto,
                contentPadding: EdgeInsets.zero,
                prefixIcon: Icon(
                  widget.prefixIcon,
                  size: widget.screenHeight * app_heights.height18,
                  color: labelTextColor,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: focusedBorderColor, width: widget.screenWidth * app_widths.width1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: enabledBorderColor, width: widget.screenWidth * app_widths.width1),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: widget.screenWidth * app_widths.width1),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: widget.screenWidth * app_widths.width1),
                ),
                suffixIcon: suffix,
                hintText: widget.hintText,
                labelText: _controller.wrapperLabelText.value,
                hintStyle: TextStyle(fontSize: widget.screenHeight * app_font_sizes.normalFontSize18),
                labelStyle: TextStyle(fontSize: widget.screenHeight * app_font_sizes.normalFontSize18, fontWeight: FontWeight.bold, color: labelTextColor)
              ),
          key: widget.textFormFieldValidationKey,
          style: TextStyle(fontSize: widget.screenHeight * app_font_sizes.normalFontSize18),
          validator: (value) {
            var msg = AlphaTextFormFieldValidatorUtilities.GlobalValidator(validatorValue: value, formFieldType: widget.textFormFieldType, wrapper: widget.wrapper);
            
            _controller.makeIsShowTextFormFieldLabelTextTrue();
            _controller.updateWrapperLabelText(widget.wrapper, widget.textFormFieldType);
            updateLabelTextColor();
            return msg;
          },
          onChanged: (value) {
            if (widget.textFormFieldValidationKey.currentState!.validate()) {
              print("Valid textFormField");
            }
          },
          onSaved: widget.onSaved,
        );
        },)
      );
  }
}
