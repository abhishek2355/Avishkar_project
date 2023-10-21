import 'package:avishkar/utils/app_text_form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;
import 'package:avishkar/Constants/app_font_sizes.dart' as app_font_sizes;
import 'package:get/get.dart';

class TextFormFields extends StatefulWidget {
  const TextFormFields({
    super.key, 
    required this.prefixIcon, 
    required this.isSuffixIcon, 
    required this.hintText, 
    required this.labelText,
    this.isShowTextFormFieldotpPage, 
    this.textFormFieldValidationKey, 
    required this.screenHeight, 
    required this.screenWidth, 
    this.onSaved, this.initialValue,    
  });
 
  final IconData prefixIcon;
  final bool isSuffixIcon;
  final String hintText;
  final String labelText;
  final bool? isShowTextFormFieldotpPage;
  final GlobalKey<FormFieldState>? textFormFieldValidationKey;
  final double screenHeight;
  final double screenWidth;
  final void Function(String?)? onSaved;
  final String? initialValue;

  @override
  State<TextFormFields> createState() => _TextFormFieldsState();
}

class _TextFormFieldsState extends State<TextFormFields> {
  final bool isShowTextFormFieldLabelText = false;
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
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed
    _controller.dispose();
    super.dispose();
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

    return SizedBox(
      height: widget.screenHeight * app_heights.height60,
      child: TextFormField(
        onSaved: widget.onSaved,
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
          labelText: widget.labelText,
          hintStyle: TextStyle(fontSize: widget.screenHeight * app_font_sizes.normalFontSize18),
          labelStyle: TextStyle(fontSize: widget.screenHeight * app_font_sizes.normalFontSize18, fontWeight: FontWeight.bold, color: labelTextColor)
        ),
      ),
      
    );
  }
}
