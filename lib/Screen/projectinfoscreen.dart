import 'package:avishkar/Screen/evaluation_screen.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;

class ProjectDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Accessing MediaQuery for responsive layout
    // Calculate the height and width of the screen.
    var media = MediaQuery.of(context);
    final double screenHeight =
        media.size.height - media.padding.top - media.padding.bottom;
    final double screenWidth =
        media.size.width - media.padding.left - media.padding.right;
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
        title: Text('Project Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ProjectPhotoWidget(imagePath: 'assets/images/Dbatu_3.jpg'),
                SizedBox(height: 16.0),
                ProjectInfoWidget(
                  projectName: 'Sample Project',
                  category: 'Medical',
                  abstract:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vel ex quis libero tincidunt fermentum. Fusce vel malesuada orci. Aenean nec bibendum ante. Sed vestibulum, sapien vel viverra tristique, sem metus convallis urna, vel egestas nulla eros eu justo. Proin tempus, mi in feugiat gravida, orci turpis ultricies arcu, in congue orci velit ut dolor. Sed vel est in orci rhoncus dapibus. Vivamus laoreet justo vel suscipit scelerisque. Vivamus tincidunt lorem ut euismod. Sed eleifend, urna ac auctor iaculis, odio mi elementum turpis, eget rhoncus quam nulla nec libero. Sed eu risus ac ipsum rhoncus lacinia.',
                ),
              ],
            ),
            SizedBox(height: 10,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal, // Set the background color to teal
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MarksEvaluationScreen()),
                  );
                },
                child: Text('Go for Evaluation -->'))
          ],
        ),
      ),
    );
  }
}

class ProjectPhotoWidget extends StatelessWidget {
  final String imagePath;

  ProjectPhotoWidget({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ProjectInfoWidget extends StatelessWidget {
  final String projectName;
  final String category;
  final String abstract;

  ProjectInfoWidget({
    required this.projectName,
    required this.category,
    required this.abstract,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Project Name:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          projectName,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 16.0),
        Text(
          'Category:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          category,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 16.0),
        Text(
          'Abstract:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 250,
          child: SingleChildScrollView(
            child: Text(
              abstract,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
