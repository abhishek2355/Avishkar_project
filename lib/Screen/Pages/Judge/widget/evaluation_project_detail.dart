import 'dart:developer';
import 'package:avishkar/Screen/Pages/Evaluation/widget/evaluation_screen.dart';
import 'package:avishkar/Screen/Pages/Project/widgets/project_detail_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;

class EvaluationProjectDetailsScreen extends StatefulWidget {
  const EvaluationProjectDetailsScreen({super.key, required this.uid});
  final String uid;
  
  

  @override
  State<EvaluationProjectDetailsScreen> createState() => _EvaluationProjectDetailsScreenState();
}

class _EvaluationProjectDetailsScreenState extends State<EvaluationProjectDetailsScreen> {
  Map<String, dynamic> data = {
    "project_name" : "",
    "category" : "",
    "project_abstrac" : ""
  };

  

  Future<void> findDocumentByUID(String uid) async {
    String collectionPath = 'Register'; // Replace with your collection path

    DocumentReference documentReference = FirebaseFirestore.instance.collection(collectionPath).doc(uid);
    DocumentSnapshot documentSnapshot = await documentReference.get();
    
    if (documentSnapshot.exists) {
      setState(() {
        data = documentSnapshot.data() as Map<String, dynamic>;
      });    
    } else {
      log("No document found with UID: $uid");
    }
  }

  @override
  void initState() {
    findDocumentByUID(widget.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Accessing MediaQuery for responsive layout
    // Calculate the height and width of the screen.
    var media = MediaQuery.of(context);
    final double screenHeight = media.size.height - media.padding.top - media.padding.bottom;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
            size: screenHeight * app_heights.height25,
          ),
        ),
        centerTitle: true,
        title: Text('Project Details', style: TextStyle(fontSize: screenHeight * app_heights.height20),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ProjectPhotoWidget(imagePath: 'assets/images/Dbatu_3.jpg', projectName: data["project_name"], category: data["category"], abstract:data["project_abstrac"]),
                ],
              ),
            ),
            
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
              child: Text('Accept', style: TextStyle(fontSize: screenHeight * app_heights.height20),),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MarksEvaluationScreen(uid: widget.uid),),);
              },
            )         
          ],
        ),
      ),
    );
  }
  
  
}
