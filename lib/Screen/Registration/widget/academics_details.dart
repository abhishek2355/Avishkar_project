import 'package:avishkar/Screen/Registration/widget/project_details.dart';
import 'package:avishkar/utils/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;

class AcademicsDetailsPage extends StatefulWidget {
  const AcademicsDetailsPage(
      {super.key,
      required this.saveFname,
      required this.saveMname,
      required this.saveLname,
      required this.saveParentName,
      required this.saveEmail,
      required this.saveMobile,
      required this.saveDOB,
      required this.saveAddress,
      required this.userUid});

  final String saveFname;
  final String saveMname;
  final String saveLname;
  final String saveParentName;
  final String saveEmail;
  final String saveMobile;
  final String saveDOB;
  final String saveAddress;
  final String userUid;

  @override
  State<AcademicsDetailsPage> createState() => _AcademicsDetailsPageState();
}

class _AcademicsDetailsPageState extends State<AcademicsDetailsPage> {
  String selectedCategory = 'Select Category'; // Set an initial value
  String selectedLevel = 'Select Level';
  String selectedDepartment = 'Select Zone';
  String saveDept = "";
  String saveCategory = "";
  String saveLavel = "";

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    final double screenHeight =
        media.size.height - media.padding.top - media.padding.bottom;
    final double screenWidth =
        media.size.width - media.padding.left - media.padding.right;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: [
                // AppBar
                Container(
                  color: const Color(0xFF212121),
                  height: screenHeight * app_heights.height66,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: screenHeight * app_heights.height28,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * app_widths.width56,
                      ),
                      Text(
                        "Academics Details",
                        style: TextStyle(fontFamily: "AppFont",
                            fontSize: screenHeight * app_heights.height28,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),

                SizedBox(height: screenHeight * app_heights.height40,),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
                  child: Container(
                    height: screenHeight * app_heights.height66,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFF212121))
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
                        isExpanded: true,
                        dropdownColor: Colors.white,
                        value: selectedDepartment,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedDepartment = newValue!;
                            saveDept = selectedDepartment;
                          });
                        },
                        items: <String>[
                          'Select Zone',
                          'Zone-1-Chhatrapati Sambhajinagar',
                          'Zone-2-LaturNanded',
                          'Zone-3-NashikJalgaon',
                          'Zone-4-SolapurPune',
                          'Zone-5-Vidarbha',
                          'Zone-6-Western-Maharashtra',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontFamily: "AppFont",
                                fontSize: screenHeight * app_heights.height20,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: screenHeight * app_heights.height40,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
                  child: Container(
                    height: screenHeight * app_heights.height66,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFF212121))
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        dropdownColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
                        value: selectedCategory,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCategory = newValue!;
                            saveCategory = selectedCategory;
                          });
                        },
                        items: <String>[
                          'Select Category',
                          'Humanities-Languages-and-Fine-Arts',
                          'Commerce-Management-and-Law',
                          'Pure-Sciences',
                          'Agriculture-and-Animal-Husbandry',
                          'Engineering-and-Technology',
                          'Medicine-and-Pharmacy',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontFamily: "AppFont",
                                fontSize: screenHeight * app_heights.height20,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: screenHeight * app_heights.height40,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
                  child: Container(
                    height: screenHeight * app_heights.height66,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFF212121))
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        dropdownColor: Colors.white,
                        value: selectedLevel,
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedLevel = newValue!;
                            saveLavel = selectedLevel;
                          });
                        },
                        items: <String>[
                          'Select Level',
                          'Undergraduate Students',
                          'Postgraduate Students',
                          'Post PG Students',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontFamily: "AppFont",
                                fontSize: screenHeight * app_heights.height20,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: screenHeight * app_heights.height40,
                ),

                SizedBox(
                  height: screenHeight * app_heights.height50,
                  child: ElevatedButton(
                    onPressed: () {
                      saveAndNext();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8e3de2),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Save & Next",
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: "AppFont",
                        fontSize: screenHeight * app_heights.height20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveAndNext() {
    if (saveDept != "Select Department" &&
        saveCategory != "Select Category" &&
        saveLavel != "Select Level" &&
        saveDept != "" &&
        saveCategory != "" &&
        saveLavel != "") {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProjectDetailsPage(
                saveFname: widget.saveFname,
                saveMname: widget.saveMname,
                saveLname: widget.saveLname,
                saveParentName: widget.saveParentName,
                saveEmail: widget.saveEmail,
                saveMobile: widget.saveMobile,
                saveDOB: widget.saveDOB,
                saveAddress: widget.saveAddress,
                saveDept: saveDept,
                saveCategory: saveCategory,
                saveLavel: saveLavel,
                userUid: widget.userUid),
          ));
    } else {
      AlphaSnackBarUtilities.showWarningAlertBar(context: context, text: "Fill all the fields.");
    }
  }
}
