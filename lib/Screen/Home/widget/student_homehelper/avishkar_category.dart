import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;

class AvishkarCategory extends StatefulWidget {
  const AvishkarCategory({super.key});

  @override
  State<AvishkarCategory> createState() => _AvishkarCategoryState();
}

class _AvishkarCategoryState extends State<AvishkarCategory> {
  @override
  Widget build(BuildContext context) {
    // Accessing MediaQuery for responsive layout
    // Calculate the height and width of the screen.
    var media = MediaQuery.of(context);
    final double screenHeight = media.size.height - media.padding.top - media.padding.bottom;
    final double screenWidth = media.size.width - media.padding.left - media.padding.right;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Appbar of the category screen.
              Row(
                children: [
                  // Back Icon.
                  IconButton(
                    onPressed: (){Navigator.pop(context);}, 
                    icon: Icon(Icons.arrow_back, size: screenHeight * app_heights.height25, color: Colors.black,),
                  ),

                  // SizedBox with width 22.
                  SizedBox(width: screenWidth * app_widths.width10,),

                  // Title of the appbar.
                  Text(
                    "Area Cover Under Each Category",
                    style: TextStyle(fontFamily: "AppFont",
                      color: Colors.black,
                      fontSize: screenHeight * app_heights.height22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),

              // Image of the category.
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
                child: Container(
                  height: screenHeight * app_heights.height209,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    border: Border.all(color: Colors.redAccent),
                    image: DecorationImage(
                      image: const AssetImage("assets/images/category.jpg"),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.7), BlendMode.softLight,)
                    ),
                  ),
                ),
              ),

              // Divider
              const Divider(),
              
              // Category Humanities, Languages and Fine Arts.
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:screenWidth * app_widths.width19,
                  vertical:screenHeight * app_heights.height5
                ),
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Humanities, Languages and Fine Arts: ",
                        style: TextStyle(fontFamily: "AppFont",fontWeight: FontWeight.bold, fontSize: screenHeight * app_heights.height18, color: Colors.black),
                      ),
                      TextSpan(
                        text: " It covers research areas like arts, languages, literature, social sciences, fine arts, journalism, mass media, education, physical education, performing arts, library science humanities and other related fields which are of social interest like agricultural extension preventive medicine and veterinary sciences, etc. However, technical innovations for the benefit of society cannot be a part of this category.",
                        style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height18, color: Colors.black),
                      )
                    ]
                  ),
                ),
              ),

              // Divider
              const Divider(),

              // Category Commerce, Management and Law.
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:screenWidth * app_widths.width19,
                  vertical:screenHeight * app_heights.height5
                ),
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Commerce, Management and Law: ",
                        style: TextStyle(fontFamily: "AppFont",fontWeight: FontWeight.bold, fontSize: screenHeight * app_heights.height18, color: Colors.black),
                      ),
                      TextSpan(
                        text: " It covers research areas like commerce, accountancy, management, finance, banking and insurance, law and other fields where these disciplines are applicable.",
                        style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height18, color: Colors.black),
                      )
                    ]
                  ),
                ),
              ),

              // Divider 
              const Divider(),

              // Category Pure Sciences
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:screenWidth * app_widths.width19,
                  vertical:screenHeight * app_heights.height5
                ),
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Pure Sciences: ",
                        style: TextStyle(fontFamily: "AppFont",fontWeight: FontWeight.bold, fontSize: screenHeight * app_heights.height18, color: Colors.black),
                      ),
                      TextSpan(
                        text: " It covers areas like all basic sciences, soil sciences, home sciences and other fields like biotechnology, microbiology, environmental sciences, life sciences, biochemistry biophysics, bl ynformatics, bioanalytical, etc.",
                        style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height18, color: Colors.black),
                      )
                    ]
                  ),
                ),
              ),
          
              // Divider
              const Divider(),

              // Category Agriculture and Animal Husbandry.
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:screenWidth * app_widths.width19,
                  vertical:screenHeight * app_heights.height5
                ),
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Agriculture and Animal Husbandry: ",
                        style: TextStyle(fontFamily: "AppFont",fontWeight: FontWeight.bold, fontSize: screenHeight * app_heights.height18, color: Colors.black),
                      ),
                      TextSpan(
                        text: " It covers areas like horticulture, agriculture, agronomy, entomology, fisheries, animal husbandry and other fields like hiotechnology, microbiology, biophysics, biochemistry. bioanalytical chemistry, etc. where agricultural and animal husbandry aspects are covered.",
                        style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height18, color: Colors.black),
                      )
                    ]
                  ),
                ),
              ),

              // Divider
              const Divider(),

              // Category Engineering and Technology.
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:screenWidth * app_widths.width19,
                  vertical:screenHeight * app_heights.height5
                ),
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Engineering and Technology: ",
                        style: TextStyle(fontFamily: "AppFont",fontWeight: FontWeight.bold, fontSize: screenHeight * app_heights.height18, color: Colors.black),
                      ),
                      TextSpan(
                        text: " It covers all branches of engineering and technology It also includes computer science information technology, data sciences, agricultural engineering, food technology, dairy technology, biophysics, biomedical and biosensor, eto where engineering and technology aspect are covered.",
                        style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height18, color: Colors.black),
                      )
                    ]
                  ),
                ),
              ),

              // Divider
              const Divider(),

              // Category Medicine and Pharmacy.
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:screenWidth * app_widths.width19,
                  vertical:screenHeight * app_heights.height5
                ),
                child: Align(
                  child: RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Medicine and Pharmacy: ",
                          style: TextStyle(fontFamily: "AppFont",fontWeight: FontWeight.bold, fontSize: screenHeight * app_heights.height18, color: Colors.black),
                        ),
                        TextSpan(
                          text: " It covers all branches of medicine and pharmacy It also includes veterinary medicine, preventive medicine, epidemiology, clinical studies, etc.",
                          style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height18, color: Colors.black),
                        )
                      ]
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}