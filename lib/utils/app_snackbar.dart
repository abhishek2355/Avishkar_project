import 'package:avishkar/Screen/Registration/apis/registration_page_apis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:quickalert/quickalert.dart';

class AlphaSnackBarUtilities {

  /// Utility method to show the snack bar on the screen.
  /// Parameters:
  ///  * [context] - context of the parent widget.
  ///  * [snackMessage] - A string message to show on the snack bar.
  ///  * [snackIcon] - Icon to show it on the screen.
  static showSnackBar({required BuildContext context, required String snackMessage, required IconData snackIcon, Color? snackColor}) {
    // Medial query
    var media = MediaQuery.of(context);
    final double screenHeight = media.size.height - media.padding.top - media.padding.bottom;
    
    // Flushbar
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      duration: const Duration(seconds: 3),
      icon: Icon(snackIcon, color: Colors.white,size: screenHeight * app_heights.height40,),
      messageText:Text( snackMessage ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: screenHeight * app_heights.height25,color: Colors.white,)),
      borderRadius: BorderRadius.circular(25),
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,

      backgroundGradient: (snackColor != null) 
        ? LinearGradient(colors: [Colors.green.shade500,Colors.green.shade300,Colors.green.shade100],stops:const [0.4, 0.7, 1],) 
        : LinearGradient(colors: [Colors.red.shade500,Colors.red.shade300,Colors.red.shade100],stops:const [0.4, 0.7, 1],),
      boxShadows:const [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(10, 10),
          blurRadius: 10,
        ),
      ],        
    ).show(context);
  }

  static showErrorAlertBar({required BuildContext context}){    
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops...',
      text: 'Sorry, something went wrong',
      autoCloseDuration: const Duration(seconds: 10)

    );
  }

  static showSuccessfullAlertBar({required BuildContext context, required String alertText, Function()? onConfirmBtnTap}){
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: alertText,
      onConfirmBtnTap: onConfirmBtnTap
    );
  }
  
  static showWarningAlertBar({required BuildContext context, required String text, Function()? onConfirmBtnTap}){
    QuickAlert.show(
      context: context,
      type: QuickAlertType.warning,
      text: text,
      onConfirmBtnTap: onConfirmBtnTap,
    );
  }





  //  Modified 
  static showConformAlertBar({
    required BuildContext context, 
    required String alertText,
    required saveFname, 
    required saveMname, 
    required saveLname,
    required saveParentName, 
    required saveEmail,
    required saveMobile,
    required saveDOB, 
    required saveAddress,
    required saveDept, 
    required saveCategory, 
    required saveLavel,
    required saveProject,
    required saveMentor,
    required saveAbstract,
    required saveIsModel,
    required userUid,
    required bool isAcceptAdmin
    }){
    var media = MediaQuery.of(context);
    final double screenHeight = media.size.height - media.padding.top - media.padding.bottom;
    QuickAlert.show(
      context: context,
      widget: Column(
        children: [
          SizedBox(height: screenHeight * app_heights.height20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: screenHeight * app_heights.height55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Color(0xFF8e3de2))
                    ),
                    backgroundColor: Colors.white,),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    child: Text('NO',
                      style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height20, color: const Color(0xFF8e3de2), fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
          
              SizedBox(
                height: screenHeight * app_heights.height50,
                child: ElevatedButton(
                  onPressed: () {
                    RegistrationAPI.addRegisterData(
                      saveFname: saveFname, 
                      saveMname: saveMname, 
                      saveLname: saveLname, 
                      saveParentName: saveParentName, 
                      saveEmail: saveEmail, 
                      saveMobile: saveMobile, 
                      saveDOB: saveDOB, 
                      saveAddress: saveAddress, 
                      saveDept: saveDept, 
                      saveCategory: saveCategory, 
                      saveLavel: saveLavel, 
                      saveProject: saveProject, 
                      saveMentor: saveMentor, 
                      saveAbstract: saveAbstract, 
                      saveIsModel: saveIsModel, 
                      userUid: userUid,
                      context: context,
                      isAcceptAdmin: isAcceptAdmin
                    );      
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8e3de2),
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                  ),
                  child: Text(
                    "YES",
                    maxLines: 1,
                    style: TextStyle(
                      fontFamily: "AppFont", 
                      fontSize: screenHeight * app_heights.height20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      type: QuickAlertType.confirm,
      text: alertText,
      showConfirmBtn: false,
      showCancelBtn: false,
      cancelBtnText: "",
      cancelBtnTextStyle: const TextStyle(fontSize: 0)
    );
    return false;
  }

}

