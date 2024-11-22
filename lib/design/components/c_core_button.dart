import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CCoreButton extends CupertinoButton {
  const CCoreButton({
    Key? key,
    Color? color,
    required Widget child,
    void Function()? onPressed,
    AlignmentGeometry alignment = Alignment.center,
    EdgeInsetsGeometry? padding = EdgeInsets.zero,
    BorderRadius? borderRadius = const BorderRadius.all(Radius.circular(12)),
  }) : super(
    key: key,
    minSize: 0,
    color: color,
    child: child,
    padding: padding,
    alignment: alignment,
    onPressed: onPressed,
    borderRadius: borderRadius,
    disabledColor: Colors.transparent,
  );
}
