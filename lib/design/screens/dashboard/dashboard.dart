import 'package:ecommerce_flutter/design/components/c_set_image.dart';
import 'package:ecommerce_flutter/utills/app_assets.dart';
import 'package:ecommerce_flutter/utills/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../tabs/cart/cart.dart';
import '../tabs/cetegory/categories.dart';
import '../tabs/home/home.dart';
import '../tabs/profile/profile.dart';
import '../tabs/wishlist/wishList.dart';


class Dashboard extends StatelessWidget{
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller:PersistentTabController(initialIndex: 0),
        navBarHeight: 60+MediaQuery.of(context).viewPadding.bottom,
        screens: const [
          HomeView(),
          WishList(),
          Categories(),
          CartView(),
          ProfileView()
        ],
        items: [
          PersistentBottomNavBarItem(
              icon:setIcon(AppBottomBar.shop,color: black),
              inactiveIcon:setIcon(AppBottomBar.shop,color: bluePrimary),
              activeColorPrimary: black
          ),
          PersistentBottomNavBarItem(
              icon: setIcon(AppBottomBar.wishlist,color: black),
              inactiveIcon:setIcon(AppBottomBar.wishlist,color: bluePrimary),
              activeColorPrimary: black
          ),
          PersistentBottomNavBarItem(
              icon: setIcon(AppBottomBar.categories,color: black),
              inactiveIcon:setIcon(AppBottomBar.categories,color: bluePrimary),
              activeColorPrimary: black

          ),
          PersistentBottomNavBarItem(
              icon: setIcon(AppBottomBar.cart,color: black),
              inactiveIcon:setIcon(AppBottomBar.cart,color: bluePrimary),
              activeColorPrimary: black
          ),
          PersistentBottomNavBarItem(
              icon: setIcon(AppBottomBar.profile,color: black),
              inactiveIcon:setIcon(AppBottomBar.profile,color: bluePrimary),
              activeColorPrimary: black
          )
        ],
        navBarStyle: NavBarStyle.style5,
      
      ),
    );
  }

}