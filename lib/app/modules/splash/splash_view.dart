import 'package:bookdianight_app/app/core/local_storage/local_storage.dart';
import 'package:bookdianight_app/app/core/resources/app_const/app_const.dart';
import 'package:bookdianight_app/app/core/resources/common_style/responsive_helper.dart';
import 'package:bookdianight_app/app/core/resources/common_widget/gradient_scaffold.dart';
import 'package:bookdianight_app/app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/resources/app_assets/app_assets.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 2));

    final token = LocalStorage.getData(key: AppConst.accessToken);
    final role = LocalStorage.getData(key: AppConst.role);

    // if (token != null && role != null) {
    //   Get.offNamed(AppRoutes.userDashboardView);
    // } else {
    //   Get.offNamed(AppRoutes.onboarding);
    // }
    Get.offNamed(AppRoutes.onboarding);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF070707),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.45,
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
          Center(
            child: Image.asset(
              AppAssets.appLogo,
              height: context.s.mtd(300, 600, 800),
              width: context.s.mtd(300, 600, 800),
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}