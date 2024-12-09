import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ecommerce_flutter/design/components/c_core_button.dart';
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

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static Widget shimmer() {
    return const Column(
      children: [
        SizedBox(height: 10),
        ContainerPlaceholder(height: 35),
        ContainerPlaceholder(),
        SizedBox(width: 20),
        CircleImagePlaceholder(),
        GridPlaceholder(),
        GridPlaceholder(itemCount: 4, height: 175),
        GridPlaceholder(itemCount: 4, height: 175),
      ],
    ).showShimmer();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
              backgroundColor: white,
              appBar: const CAppBar(),
              body: RefreshIndicator(
                onRefresh: controller.Init,
                child: ListView(
                    physics: AlwaysScrollableScrollPhysics(),
                    children: [
                      controller.isLoading
                          ? shimmer()
                          : Column(
                              children: AnimationConfiguration.toStaggeredList(
                                  childAnimationBuilder: (widget) =>
                                      SlideAnimation(
                                        horizontalOffset: -50.0,
                                        child: FadeInAnimation(child: widget),
                                      ),
                                  children: [
                                  WelcomeText(),
                                  AnnouncementCard(),
                                  ViewAllRaw(title: "Recently viewed"),
                                  RecentlyViewd(),
                                  ViewAllRaw(title: "My Orders"),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  MyOrderButtons(),
                                ])).defaultPadding()
                    ]),
              ));
        });
  }
}

class CAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: white,
      leading: Container(
        margin: const EdgeInsetsDirectional.only(start: 20),
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: black.withOpacity(0.2),
                offset: Offset(0, 0),
                blurRadius: 10)
          ],
          shape: BoxShape.circle,
          border: Border.all(color: white),
        ),
        child: CircleAvatar(
          child: Image.asset(AppImages.user),
        ),
      ),
      title: ElevatedButton(
        onPressed: () {},
        child: CText(
          "My Activity",
          style: TextStyle(color: white),
        ),
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(10),
            backgroundColor: bluePrimary,
            fixedSize: Size(110, 35)),
      ),
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
        const SizedBox(
          width: 20,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 55);
}

class WelcomeText extends StatelessWidget {
  const WelcomeText();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Align(
        alignment: Alignment.topLeft,
        child: AnimatedTextKit(isRepeatingAnimation: false, animatedTexts: [
          TyperAnimatedText("Hello, Romina!",
              textStyle: TextThemeX.text28,
              speed: const Duration(microseconds: 400))
        ]),
      );
    });
  }
}

class AnnouncementCard extends StatelessWidget {
  const AnnouncementCard();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CText(
                "Announcement",
                style: TextThemeX.text14,
              ),
              SizedBox(height: 5),
              CText(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nMaecenas hendrerit luctus libero ac vulputate.",
                style: TextThemeX.text10,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
          setIcon(AppIcon.rightArrow)
        ],
      ).defaultContainer(hm: 0, vm: 8);
    });
  }
}

class MyOrderButtons extends StatelessWidget {
  const MyOrderButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CCoreButton(
              child: Container(
            height: 35,
            width: 100,
            decoration: BoxDecoration(
              color: blueSeconadry,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: CText(
                "To Pay",
                style: TextThemeX.text16.copyWith(color: bluePrimary),
              ),
            ),
          )),
        ),
        SizedBox(width: 8),
        Expanded(
          child: CCoreButton(
              child: Container(
            height: 35,
            width: 116,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: blueSeconadry),
            child: Center(
              child: CText(
                "To Recieve",
                style: TextThemeX.text16.copyWith(color: bluePrimary),
              ),
            ),
          )),
        ),
        SizedBox(width: 8),
        Expanded(
          child: CCoreButton(
              child: Container(
            height: 35,
            width: 116,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: blueSeconadry),
            child: Center(
              child: CText(
                "To Review",
                style: TextThemeX.text16.copyWith(color: bluePrimary),
              ),
            ),
          )),
        )
      ],
    );
  }
}

class RecentlyViewd extends StatelessWidget {
  const RecentlyViewd();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Expanded(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  height: 50,
                  width: 50,
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      border: Border.all(color: white),
                      boxShadow: [
                        BoxShadow(
                            color: black.withOpacity(0.2),
                            offset: Offset(0, 0),
                            blurRadius: 10)
                      ],
                      shape: BoxShape.circle),
                  child: Image.asset(AppImages.girl));
            }),
      ),
    );
  }
}
