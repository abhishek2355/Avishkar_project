import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    // Accessing MediaQuery for responsive layout
    // Calculate the height and width of the screen.
    var media = MediaQuery.of(context);
    final double screenHeight = media.size.height - media.padding.top - media.padding.bottom;

    String filterValue;

    List filteritem = [
      "Engineering",
      "Agriculture",
      "Pharmacy",
      "Biotechnical",
      "Aerospace"
    ];

    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.all(screenHeight * app_heights.height8),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){Navigator.pop(context);},
                  child: Icon(Icons.arrow_back_rounded)),
                Icon(Icons.filter_list_outlined),
                // DropdownButton(
                //   value: filteritem,
                //   onChanged: (newValue) {
                //     setState(() {
                //        filterValue = newValue;
                //     });
                //   },
                //   items: filteritem.map((filteritem) {
                //     return DropdownMenuItem(
                //       value: filteritem,
                //       child: Text(filteritem),
                //     );
                //   }).toList(),
                // ),
              ],
            ),
            SizedBox(
              height: screenHeight * app_heights.height10,
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Student Name"),
              subtitle: Text("Project Title"),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Student Name"),
              subtitle: Text("Project Title"),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Student Name"),
              subtitle: Text("Project Title"),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Student Name"),
              subtitle: Text("Project Title"),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Student Name"),
              subtitle: Text("Project Title"),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Student Name"),
              subtitle: Text("Project Title"),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Student Name"),
              subtitle: Text("Project Title"),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Student Name"),
              subtitle: Text("Project Title"),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Student Name"),
              subtitle: Text("Project Title"),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Student Name"),
              subtitle: Text("Project Title"),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Student Name"),
              subtitle: Text("Project Title"),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Student Name"),
              subtitle: Text("Project Title"),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Student Name"),
              subtitle: Text("Project Title"),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Student Name"),
              subtitle: Text("Project Title"),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Student Name"),
              subtitle: Text("Project Title"),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Student Name"),
              subtitle: Text("Project Title"),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Student Name"),
              subtitle: Text("Project Title"),
            ),
          ],
        ),
      )),
    );
  }

  void setState(Null Function() param0) {}
}
