import 'package:ecommerce_flutter/utills/app_assets.dart';
import 'package:ecommerce_flutter/utills/app_texttheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:slide_countdown/slide_countdown.dart';

import '../../utills/app_colors.dart';
import 'c_core_button.dart';
import 'c_set_image.dart';
import 'c_text.dart';

class ViewAllRaw extends StatelessWidget{
  final String title;
  final void Function()? onPress;
  final String? text;
  final String type;

  const ViewAllRaw({
    super.key,
    required this.title,
    this.onPress,
    this.text,
    this.type="default",
  });

  @override
  Widget build(BuildContext context) {
   return CCoreButton(
     onPressed: onPress,
     child:Row(
         children: [
           CText(title,style:TextThemeX.text21,),
           if(onPress != null)...[
             Spacer(),
             ...buildTrailing(type)
           ]
         ],
       ),
   );
  }
}
List<Widget>buildTrailing(String type){
  switch(type){

    case 'viewAll':
      return [
        CText("View All",) ,
        SizedBox(width:10,),
        SvgPicture.asset(AppIcon.rightArrow),
      ];
    case 'timer':
      return [
        setIcon(AppIcon.clock),
        SizedBox(width:8,),
         SlideCountdownSeparated(
          separator: "",
          style:TextThemeX.text17,
          duration: Duration(hours:4),
          decoration:BoxDecoration(
            color: lightPink,
            borderRadius: BorderRadius.circular(7)

          ),
        )

      ];
    default :
      return [];
  }
}


