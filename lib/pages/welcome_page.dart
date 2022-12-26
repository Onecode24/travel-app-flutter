import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/pages/navpages/main_page.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    List images = [
      "welcome-one.png",
      "welcome-two.png",
      "welcome-three.png",
    ];

    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("img/" + images[index]),
                    fit: BoxFit.cover)),
            child: Container(
                margin: EdgeInsets.only(left: 30, top: 150, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: 'Trips'),
                        AppText(text: 'Mountain'),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            width: 300,
                            child: AppText(
                              text:
                                  'Mountains hikes give you an incredible sense of freedom along with endurance test',
                              color: AppColors.textColor2,
                              size: 18,
                            )),
                        SizedBox(
                          height: 40,
                        ),
                        new GestureDetector(
                          onTap: (){
                            if(index==2){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>MainPage()));
                            }else{
                              print("Not the last");
                            }
                          },
                          child: ResponsiveButton(
                            width: 120,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDots) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 3),
                          width: 8,
                          height: index == indexDots ? 25 : 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == indexDots
                                ? AppColors.mainColor
                                : AppColors.mainColor.withOpacity(0.3),
                          ),
                        );
                      }),
                    )
                  ],
                )),
          );
        },
      ),
    );
  }
}
