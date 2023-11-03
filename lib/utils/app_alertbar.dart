import 'package:avishkar/Screen/Pages/Registration/apis/registration_page_apis.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;

class AppAlertBar {
  static getAlertBar(
      {required BuildContext context,
      required String firstName,
      required String middleName,
      required String lastName,
      required String address,
      required String? email,
      required String mobile,
      required String birthDate,
      required String level,
      required String parentName,
      required String abstract,
      required String department,
      required String projectName,
      required String category,
      required String modelReady,
      required String mentor,
      required String uid}) {
    // Accessing MediaQuery for responsive layout
    // Calculate the height and width of the screen.
    var media = MediaQuery.of(context);
    final double screenHeight =
        media.size.height - media.padding.top - media.padding.bottom;

    // Create button
    Widget okButton = ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: Text(
        "OK",
        style: TextStyle(fontSize: screenHeight * app_heights.height25),
      ),
      onPressed: () async {
        await RegistrationAPI.addRegisterData(
          saveFname: firstName,
          saveMname: middleName,
          saveLname: lastName,
          saveAddress: address,
          saveEmail: email,
          saveMobile: mobile,
          saveDOB: birthDate,
          saveLavel: level,
          saveParentName: parentName,
          saveAbstract: abstract,
          saveDept: department,
          saveProject: projectName,
          saveCategory: category,
          saveIsModel: modelReady,
          saveMentor: mentor,
          context: context,
          userUid: uid,
        );
      },
    );

    Widget cancelButton = ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      child: Text(
        "Cancel",
        style: TextStyle(fontSize: screenHeight * app_heights.height25),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Want To Submit!",
        style: TextStyle(
            fontSize: screenHeight * app_heights.height30, color: Colors.red),
      ),
      content: Text(
        "Once submited changes cannot be made.",
        style: TextStyle(fontSize: screenHeight * app_heights.height25),
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [cancelButton, okButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
