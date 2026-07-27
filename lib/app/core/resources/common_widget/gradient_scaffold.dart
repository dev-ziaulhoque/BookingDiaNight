import 'package:flutter/material.dart';
import '../../extentions/theme_extention.dart';
import '../../utils/resource_const.dart';
import '../common_style/responsive_helper.dart';

class GradientScaffold extends StatelessWidget {
  final Widget body;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final FloatingActionButton? floatingActionButton;
  final Widget? bottomNavigationBar;

  const GradientScaffold({
    super.key,
    required this.body,
    this.padding,
    this.backgroundColor,
    this.floatingActionButton,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? const Color(0xFF070707),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.45,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    const Color(0xFFC88E02).withOpacity(0.20),
                    const Color(0xFFC88E02).withOpacity(0.0),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding:
                padding ??
                EdgeInsets.symmetric(
                  horizontal: context.s.size(16, tablet: 60),
                  vertical: context.s.size(16, tablet: 60),
                ),
            height: double.infinity,
            width: double.infinity,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              extendBody: true,
              body: body,
              bottomNavigationBar: bottomNavigationBar,
            ),
          ),
        ],
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
