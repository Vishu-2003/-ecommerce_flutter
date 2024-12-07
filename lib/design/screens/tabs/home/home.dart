import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ecommerce_flutter/design/components/c_extension.dart';
import 'package:ecommerce_flutter/design/components/c_set_image.dart';
import 'package:ecommerce_flutter/design/components/c_shimmer_placeholders.dart';
import 'package:ecommerce_flutter/design/components/c_view_allraw.dart';
import 'package:ecommerce_flutter/design/screens/tabs/home/home_controller.dart';
import 'package:ecommerce_flutter/utills/app_assets.dart';
import 'package:ecommerce_flutter/utills/app_colors.dart';
import 'package:ecommerce_flutter/utills/app_texttheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../components/c_text.dart';

class HomeView extends StatelessWidget{
  const HomeView({super.key});
  static Widget Shimmer(){
    return Column(
      children: [
        SizedBox(height: 40,),
        ContainerPlaceholder(),
        SizedBox(width: 20),
        CircleImagePlaceholder(),
        GridPlaceholder(),
        GridPlaceholder(itemCount: 4,height: 175,),
        GridPlaceholder(itemCount: 4,height: 175),
      ],
    ).showShimmer();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeController(),
        builder: (controller){
      return Scaffold(
        backgroundColor: white,
        appBar:CAppBar(),
        body:RefreshIndicator(
          onRefresh: controller.Init,
          child: ListView(
              physics: AlwaysScrollableScrollPhysics(),
              children: [
                controller.isLoading
                    ? Shimmer()
                    : Column(
                  children: AnimationConfiguration.toStaggeredList(
                      childAnimationBuilder: (widget) => SlideAnimation(
                        horizontalOffset: -50.0,
                        child: FadeInAnimation(child: widget),
                      ),
                      children: [
                        WelcomeText(),
                        AnnouncementCard(),
                        ViewAllRaw(title: "Recently viewed"),
                      ]
                  )
                ).defaultPadding()
              ]
            ),
        )
      );
    });
  }
}
class CAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
    backgroundColor: white,
    leading:Container(
        margin: const EdgeInsetsDirectional.only(start: 20),
        padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
            boxShadow: [
                   BoxShadow(
                     color: black.withOpacity(0.2),
                     offset: Offset(0,0),
                     blurRadius: 10
                   )
            ],
            shape: BoxShape.circle,
            border: Border.all(color:white),
        ),
        child: CircleAvatar(child:Image.asset(AppImages.user),),
      ),
    title:ElevatedButton(
      onPressed: (){},
      child:CText("My Activity",style: TextStyle(color: white),),
      style:ElevatedButton.styleFrom(
          padding: EdgeInsets.all(10),
          backgroundColor: bluePrimary,
          fixedSize: Size(110,35)),),
    actions: [
      CircleAvatar(
        backgroundColor: greyWhite,
        child: setIcon(AppIcon.scan),
      ),
      const SizedBox(width: 8),
      CircleAvatar(
        backgroundColor: greyWhite,
        child: setIcon(AppIcon.menu),
      ),
      const SizedBox(width: 8),
      CircleAvatar(
        backgroundColor: greyWhite,
        child: setIcon(AppIcon.setting),
      ),
      const SizedBox(width: 20,)
    ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity,55);

}
class WelcomeText extends StatelessWidget{
  const WelcomeText();

  @override
  Widget build(BuildContext context) {
   return GetBuilder<HomeController>(builder: (controller){
     return Align(
       alignment: Alignment.topLeft,
       child: AnimatedTextKit(
           isRepeatingAnimation: false,
           animatedTexts:[
             TyperAnimatedText(
                 "Hello, Romina!",
                 textStyle:TextThemeX.text28,
                 speed: const Duration(microseconds: 400)
             )
           ]),
     );
   });
  }

}
class AnnouncementCard extends StatelessWidget{
  const AnnouncementCard();

  @override
  Widget build(BuildContext context) {
   return GetBuilder<HomeController>(
       builder: (controller){
       return Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               CText("Announcement",style: TextThemeX.text14,),
               SizedBox(height: 5),
               CText("Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nMaecenas hendrerit luctus libero ac vulputate.",
                 style: TextThemeX.text10,
                 softWrap: true,
                 overflow: TextOverflow.ellipsis,
               )
             ],
           ),
           setIcon(AppIcon.rightArrow)
         ],
       ).defaultContainer(hm: 0,vm:8);
   });
  }

}
