import 'package:flutter/material.dart';

class StudentDetailScreen extends StatelessWidget {
  StudentDetailScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
              color: Colors.teal,
            ),
            height: 160,
            child: Stack(
              children: [
                Positioned(
                  top: 40,
                  left: 150,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color.fromARGB(255, 11, 217, 159),
                    ),
                    height: 25,
                    width: 90,
                    child: Center(
                      child: Text(
                        "Student Info",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 25,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 55,
                    backgroundImage: AssetImage('assets/student_avatar.png'),
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 150,
                  child: Text(
                    "Vishal Ambekar",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
                Positioned(
                  top: 20,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                Card(
                  elevation: 3,
                  child: ListTile(
                    title: Text('Name'),
                    subtitle: Text("Vishal"),
                  ),
                ),
                Card(
                  elevation: 3,
                  child: ListTile(
                    title: Text('Department'),
                    subtitle: Text("IT"),
                  ),
                ),
                Card(
                  elevation: 3,
                  child: ListTile(
                    title: Text('Project Title'),
                    subtitle: Text("XYZ"),
                  ),
                ),
                Card(
                  elevation: 3,
                  child: ListTile(
                    title: Text('Discipline'),
                    subtitle: Text("xy"),
                  ),
                ),
                Card(
                  elevation: 3,
                  child: ListTile(
                    title: Text('Project Abstract'),
                    subtitle: Text("xy"),
                  ),
                ),
                Card(
                  elevation: 3,
                  child: ListTile(
                    title: Text('Project Abstract'),
                    subtitle: Text("xy"),
                  ),
                ),
                Card(
                  elevation: 3,
                  child: ListTile(
                    title: Text('Project Abstract'),
                    subtitle: Text("xy"),
                  ),
                ),
                Card(
                  elevation: 3,
                  child: ListTile(
                    title: Text('Project Abstract'),
                    subtitle: Text("xy"),
                  ),
                ),
                Card(
                  elevation: 3,
                  child: ListTile(
                    title: Text('Project Abstract'),
                    subtitle: Text("xy"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
