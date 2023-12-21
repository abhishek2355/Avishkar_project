import 'package:avishkar/Screen/Home/widget/student_homehelper/avishkar_category.dart';
import 'package:avishkar/Screen/Home/widget/student_homehelper/avishkar_objective.dart';
import 'package:avishkar/Screen/Home/widget/student_homehelper/avishkar_project_registration_rule.dart';
import 'package:avishkar/Screen/Home/widget/student_homehelper/avishkar_schedule.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;

class SettingPage extends StatefulWidget {
  const SettingPage({super.key, this.user});

  final User? user;


  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  
  @override
  Widget build(BuildContext context) {
    // Accessing MediaQuery for responsive layout
    // Calculate the height and width of the screen.
    var media = MediaQuery.of(context);
    final double screenHeight = media.size.height - media.padding.top - media.padding.bottom;
    final double screenWidth = media.size.width - media.padding.left - media.padding.right;

    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            SingleChildScrollView(
              child: Container(
                width: screenWidth * app_widths.width368,
                height: screenHeight,
                color: const Color.fromARGB(255, 50, 166, 182),
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white24,
                        child: Icon(
                          CupertinoIcons.person, 
                          color: Colors.white,
                          size: screenHeight * app_heights.height25,
                        ),
                      ),
                      title: Text(widget.user!.email!, maxLines: 1, style: TextStyle(color: Colors.white, fontSize: screenHeight * app_heights.height18),),
                      subtitle: Text("Avishkar 2023 - 24", style: TextStyle(color: Colors.white, fontSize: screenHeight * app_heights.height15),),
                    ),
                      
                    const Divider(),
                      
                    ListTile(
                      trailing:  Icon(Icons.arrow_forward_ios, size: screenHeight * app_heights.height25, color: Colors.white,),
                      title: Text("Registration Process", style: TextStyle(fontSize: screenHeight * app_heights.height18, color: Colors.white,),),
                      leading:Icon(Icons.app_registration, size: screenHeight * app_heights.height25, color: Colors.white,),
                      onTap: (){
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegistrationRule()));},
                    ),
                
                    ListTile(
                      trailing:  Icon(Icons.arrow_forward_ios, size: screenHeight * app_heights.height25, color: Colors.white,),
                      title: Text("Avishkar Objectives", style: TextStyle(fontSize: screenHeight * app_heights.height18, color: Colors.white,),),
                      leading:Icon(Icons.emoji_objects, size: screenHeight * app_heights.height25, color: Colors.white,),
                      onTap: (){
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const AvishkarObjectives()));},
                    ),
                
                    ListTile(
                      trailing:  Icon(Icons.arrow_forward_ios, size: screenHeight * app_heights.height25, color: Colors.white,),
                      title: Text("Avishkar Schedule", style: TextStyle(fontSize: screenHeight * app_heights.height18, color: Colors.white,),),
                      leading:Icon(Icons.schedule_outlined, size: screenHeight * app_heights.height25, color: Colors.white,),
                      onTap: (){
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const AvishkarSchedule()));},
                    ),
                      
                    ListTile(
                      trailing:  Icon(Icons.arrow_forward_ios, size: screenHeight * app_heights.height25, color: Colors.white,),
                      title: Text("Avishkar Category's", style: TextStyle(fontSize: screenHeight * app_heights.height18, color: Colors.white,),),
                      leading:Icon(Icons.schedule_outlined, size: screenHeight * app_heights.height25, color: Colors.white,),
                      onTap: (){
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const AvishkarCategory()));},
                    ),
                
                    ListTile(
                      trailing:  Icon(Icons.arrow_forward_ios, size: screenHeight * app_heights.height25, color: Colors.white,),
                      title: Text("Logout", style: TextStyle(fontSize: screenHeight * app_heights.height18, color: Colors.white,), ),
                      leading:Icon(Icons.logout_outlined, size: screenHeight * app_heights.height25, color: Colors.white,),
                      onTap: () async{
                        Navigator.pop(context);
                        await FirebaseAuth.instance.signOut();
                      },
                    ),
                
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){Navigator.pop(context);},
              child: Container(
                color: Colors.transparent,
                height: double.infinity,
                width: screenWidth - (screenWidth * app_widths.width368),
              ),
            )
          ],
        ),
      )
    );
  }
}