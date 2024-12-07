import 'package:ecommerce_flutter/design/components/c_extension.dart';
import 'package:ecommerce_flutter/utills/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../utills/app_constants.dart';

class ContainerPlaceholder extends StatelessWidget {
  final double height;
  final double width;
  final double boarderRadius;
  final EdgeInsets margin;

  const ContainerPlaceholder({
    super.key,
    this.height=70,
    this.width=double.infinity,
    this.boarderRadius=defaultRadius,
    this.margin=const EdgeInsets.symmetric(horizontal: 20,vertical: 5)
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        margin: margin,
        decoration: BoxDecoration(
          color: white,
          borderRadius:BorderRadius.circular(boarderRadius)
        ),
    );
  }
}

class CircleImagePlaceholder extends StatelessWidget{
  final int itemCount;
  final double maxCrossAxisExtent;
  final EdgeInsets padding;

  const CircleImagePlaceholder({
    super.key,
    this.itemCount=4,
    this.maxCrossAxisExtent=100,
    this.padding= const EdgeInsets.symmetric(vertical:20,horizontal:18)
  });

  @override
  Widget build(BuildContext context) {
   return AlignedGridView.custom(
     shrinkWrap: true,
     mainAxisSpacing:4,
     crossAxisSpacing:4,
     padding:padding,
     itemCount: itemCount,
     gridDelegate: SliverSimpleGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: maxCrossAxisExtent),
     itemBuilder: (context, index) {
       return CircleAvatar(radius: 30,);
     },
   );
  }
}

class GridPlaceholder extends StatelessWidget{
  final double height;
  final double width;
  final double maxCrossAxisExtent;
  final int itemCount;
  final double boarderRadius;
  final EdgeInsets padding;
  const GridPlaceholder({
    super.key,
    this.height=35,
    this.boarderRadius=20,
    this.width=double.infinity,
    this.maxCrossAxisExtent=150,
    this.itemCount=3,
    this.padding= const EdgeInsets.symmetric(vertical:10,horizontal:18)
  });
  @override
  Widget build(BuildContext context) {
    return AlignedGridView.custom(
      itemCount: 3,
      shrinkWrap: true,
      crossAxisSpacing: 5,
      padding: padding,
      gridDelegate: SliverSimpleGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: maxCrossAxisExtent),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: white,
              borderRadius:BorderRadius.circular(boarderRadius)
          ),
        );
      },);
  }

}