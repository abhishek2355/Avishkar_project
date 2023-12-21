import 'dart:developer';
import 'package:avishkar/Screen/Registration/apis/registration_model.dart';
import 'package:avishkar/Screen/Registration/apis/registration_page_apis.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;

class StudentDetailScreen extends StatefulWidget {
  const StudentDetailScreen({super.key, required this.email});
  final String email;

  @override
  State<StudentDetailScreen> createState() => _StudentDetailScreenState();
}

class _StudentDetailScreenState extends State<StudentDetailScreen> {
  bool isLoading = false;
  RegistrationModel? userData;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  _getData() async {
    try {
      userData = await RegistrationAPI.fetchData(widget.email);
      setState(() {
        isLoading = true;
      });
    } catch (e) {
      log('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Accessing MediaQuery for responsive layout
    // Calculate the height and width of the screen.
    var media = MediaQuery.of(context);
    final double screenHeight = media.size.height - media.padding.top - media.padding.bottom;

    return Scaffold(
      body: (isLoading)
        ? CustomScrollView(
            slivers: <Widget>[
              // Silver appBar for the preview screen.
              SliverAppBar(
                backgroundColor: Colors.grey[300],
                pinned: true,
                leading: IconButton(
                  onPressed: (){Navigator.pop(context);}, 
                  icon: Icon(Icons.arrow_back, color: Colors.black, size: screenHeight * app_heights.height25,),
                ),                  
                expandedHeight: screenHeight * app_heights.height315,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(userData!.profileUrl),
                          radius: screenHeight * app_heights.height100,
                        ),

                        SizedBox(height: screenHeight * app_heights.height20,),
                        
                        Text('${userData!.saveFname} ${userData!.saveMname} ${userData!.saveLname}', style: TextStyle(fontSize:  screenHeight * app_heights.height25, fontWeight: FontWeight.bold), maxLines: 1,)
                      ],
                    ),
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: screenHeight * app_heights.height25,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(userData!.profileUrl),
                    ),
                  )
                ]
              ),

              // Child of the screens.
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Column(
                      children: [
                        // Project Name
                        Card(
                          elevation: 3,
                          child: ListTile(
                            title: Text(
                              style: TextStyle(fontSize: screenHeight * app_heights.height25),
                              'Project Title'
                            ),
                            subtitle: Text(
                              style: TextStyle(fontSize: screenHeight * app_heights.height25),
                              userData!.saveProject,
                            ),
                          ),
                        ),
                        
                        // Mentor Name
                        Card(
                          elevation: 3,
                          child: ListTile(
                            title: Text(
                              style: TextStyle(fontSize: screenHeight * app_heights.height25),
                              'Mentor Name'
                            ),
                            subtitle: Text(
                              style: TextStyle(fontSize:screenHeight * app_heights.height25),
                              userData!.saveMentor
                            ),
                          ),
                        ),
                        
                        // email of student.
                        Card(
                          elevation: 3,
                          child: ListTile(
                            title: Text(
                              style: TextStyle(fontSize: screenHeight * app_heights.height25),
                              'Email',
                            ),
                            subtitle: Text(
                              style: TextStyle(fontSize: screenHeight * app_heights.height25),
                              userData!.saveEmail,
                            ),
                          ),
                        ),
                        
                        // Mobile Number of the student.
                        Card(
                          elevation: 3,
                          child: ListTile(
                            title: Text(
                              style: TextStyle(fontSize: screenHeight * app_heights.height25),
                              'Mobile',
                            ),
                            subtitle: Text(
                              style: TextStyle(fontSize: screenHeight * app_heights.height25),
                              userData!.saveMobile,
                            ),
                          ),
                        ),
                        
                        // Mother name.
                        Card(
                          elevation: 3,
                          child: ListTile(
                            title: Text(
                              style: TextStyle(fontSize: screenHeight * app_heights.height25),
                              'Mother Name',
                            ),
                            subtitle: Text(
                              style: TextStyle(fontSize: screenHeight * app_heights.height25),
                              userData!.saveParentName,
                            ),
                          ),
                        ),
                        
                        // Address of student.
                        Card(
                          elevation: 3,
                          child: ListTile(
                            title: Text(
                              style: TextStyle(fontSize: screenHeight * app_heights.height25),
                              'Address',
                            ),
                            subtitle: Text(
                              style: TextStyle(fontSize: screenHeight * app_heights.height25),
                              userData!.saveAddress,
                            ),
                          ),
                        ),
                        
                        // Zone of student.
                        Card(
                          elevation: 3,
                          child: ListTile(
                            title: Text(
                              style: TextStyle(fontSize: screenHeight * app_heights.height25),
                              'Zone',
                            ),
                            subtitle: Text(
                              style: TextStyle(fontSize: screenHeight * app_heights.height25),
                              userData!.saveDept,
                            ),
                          ),
                        ),
                        
                        // Discipline of the student.
                        Card(
                          elevation: 3,
                          child: ListTile(
                            title: Text(
                              style: TextStyle(fontSize: screenHeight * app_heights.height25),
                              'Discipline',
                            ),
                            subtitle: Text(
                              style: TextStyle(fontSize: screenHeight * app_heights.height25),
                              userData!.saveCategory,
                            ),
                          ),
                        ),
                        
                        // Date of Birth.
                        Card(
                          elevation: 3,
                          child: ListTile(
                            title: Text(
                              style: TextStyle(fontSize: screenHeight * app_heights.height25),
                              'Birth Date',
                            ),
                            subtitle: Text(
                              style: TextStyle(fontSize: screenHeight * app_heights.height25),
                              userData!.saveDOB,
                            ),
                          ),
                        ),
                        
                        // Project Abstract.
                        Card(
                          elevation: 3,
                          child: ListTile(
                            title: Text(
                              style: TextStyle(fontSize: screenHeight * app_heights.height25),
                              'Project Abstract'
                            ),
                            subtitle: Text(
                              style: TextStyle(fontSize: screenHeight * app_heights.height25),
                              userData!.saveAbstract,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  childCount: 1,
                ),
              ),
            ],
          )
        : const Center(
          child: CircularProgressIndicator(),
        )
    );
  }
}
