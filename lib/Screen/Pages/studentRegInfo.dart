import 'package:flutter/material.dart';

class StudentDetailScreen extends StatelessWidget {
  StudentDetailScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Student Name"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/student_avatar.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              elevation: 3,
              child: ListTile(
                title: Text('Name'),
                subtitle: Text("Vishal"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              elevation: 3,
              child: ListTile(
                title: Text('Department'),
                subtitle: Text("IT"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              elevation: 3,
              child: ListTile(
                title: Text('Project Name'),
                subtitle: Text("XYZ"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              elevation: 3,
              child: ListTile(
                title: Text('Project Abstract'),
                subtitle: Text("xy"),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(12.0),
          //   child: Card(
          //     elevation: 3,
          //     child: ListTile(
          //       title: Text('Discipline'),
          //       subtitle: Text("xy"),
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(12.0),
          //   child: Card(
          //     elevation: 3,
          //     child: ListTile(
          //       title: Text('Project Abstract'),
          //       subtitle: Text("xy"),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
