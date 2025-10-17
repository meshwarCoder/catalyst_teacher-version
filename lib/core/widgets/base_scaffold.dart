import 'package:flutter/material.dart';
import 'package:catalyst/core/utils/app_colors.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({
    super.key,
    required this.child,
    this.drawer,
    this.appBar,
  });

  final Widget child;
  final Widget? drawer;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.scaffoldBackground,
      drawer: drawer,
     appBar: appBar,
      body: child,
    );
  }
}
