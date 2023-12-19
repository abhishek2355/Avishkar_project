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
        // backgroundColor: Colors.black12,
        body: SingleChildScrollView(
          child: Column(
            children: [
          
              // Row for the
              Row(
                children: [
                  IconButton(
                    onPressed: (){Navigator.pop(context);}, 
                    icon: Icon(Icons.arrow_back, size: screenHeight * app_heights.height25, color: Colors.black,),
                  ),
          
                  SizedBox(width: screenWidth * app_widths.width22,),
          
                  Text(
                    "Area Cover Under Each Category",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenHeight * app_heights.height22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
          
                ],
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
                child: Container(
                  height: screenHeight * app_heights.height209,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
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

              const Divider(),
                
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
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenHeight * app_heights.height18, color: Colors.black),
                      ),
                      TextSpan(
                        text: " It covers research areas like arts, languages, literature, social sciences, fine arts, journalism, mass media, education, physical education, performing arts, library science humanities and other related fields which are of social interest like agricultural extension preventive medicine and veterinary sciences, etc. However, technical innovations for the benefit of society cannot be a part of this category.",
                        style: TextStyle(fontSize: screenHeight * app_heights.height18, color: Colors.black),
                      )
                    ]
                  ),
                ),
              ),

              const Divider(),

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
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenHeight * app_heights.height18, color: Colors.black),
                      ),
                      TextSpan(
                        text: " It covers research areas like commerce, accountancy, management, finance, banking and insurance, law and other fields where these disciplines are applicable.",
                        style: TextStyle(fontSize: screenHeight * app_heights.height18, color: Colors.black),
                      )
                    ]
                  ),
                ),
              ),

              const Divider(),

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
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenHeight * app_heights.height18, color: Colors.black),
                      ),
                      TextSpan(
                        text: " It covers areas like all basic sciences, soil sciences, home sciences and other fields like biotechnology, microbiology, environmental sciences, life sciences, biochemistry biophysics, bl ynformatics, bioanalytical, etc.",
                        style: TextStyle(fontSize: screenHeight * app_heights.height18, color: Colors.black),
                      )
                    ]
                  ),
                ),
              ),
          
              const Divider(),

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
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenHeight * app_heights.height18, color: Colors.black),
                      ),
                      TextSpan(
                        text: " It covers areas like horticulture, agriculture, agronomy, entomology, fisheries, animal husbandry and other fields like hiotechnology, microbiology, biophysics, biochemistry. bioanalytical chemistry, etc. where agricultural and animal husbandry aspects are covered.",
                        style: TextStyle(fontSize: screenHeight * app_heights.height18, color: Colors.black),
                      )
                    ]
                  ),
                ),
              ),

              const Divider(),

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
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenHeight * app_heights.height18, color: Colors.black),
                      ),
                      TextSpan(
                        text: " It covers all branches of engineering and technology It also includes computer science information technology, data sciences, agricultural engineering, food technology, dairy technology, biophysics, biomedical and biosensor, eto where engineering and technology aspect are covered.",
                        style: TextStyle(fontSize: screenHeight * app_heights.height18, color: Colors.black),
                      )
                    ]
                  ),
                ),
              ),

              const Divider(),

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
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenHeight * app_heights.height18, color: Colors.black),
                        ),
                        TextSpan(
                          text: " It covers all branches of medicine and pharmacy It also includes veterinary medicine, preventive medicine, epidemiology, clinical studies, etc.",
                          style: TextStyle(fontSize: screenHeight * app_heights.height18, color: Colors.black),
                        )
                      ]
                    ),
                  ),
                ),
              ),
          
              
            ],
          ),
        ),
      )
    );
  }
}