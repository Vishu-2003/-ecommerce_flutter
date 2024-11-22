import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../utills/app_colors.dart';
import '../../utills/app_constants.dart';

extension WidgetExtension on Widget{

  Widget defaultPadding({
    double hp=20,
    double vp=0
  }){
    return Padding(padding: EdgeInsets.symmetric(horizontal:hp ,vertical:vp ),child: this,);
  }
  Widget defaultContainer({
    double hm=20,
    double vm=0,
    double hp=5,
    double vp=5,
    double boarderRadius=defaultRadius,
    BoxBorder? border,
    Color color=white
  })  {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: hm,vertical: vm),
      padding: EdgeInsets.symmetric(horizontal: hp,vertical: vp),
      decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(defaultRadius),
       border: border,
       color: color
       ),
       child: this,
    );}

  Widget showShimmer(){
  return  Shimmer.fromColors(
      baseColor:Colors.white,
      highlightColor: Colors.grey.shade200,
      child:this
  );}

}