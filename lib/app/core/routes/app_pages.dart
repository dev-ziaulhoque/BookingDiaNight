import 'package:bookdianight_app/app/modules/onboarding/onboarding_view.dart';
import 'package:get/get.dart';
import '../../modules/splash/splash_view.dart';
import 'app_routes.dart';
import 'not_found_page.dart';


class AppPages {
  AppPages._();


  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      transition: Transition.fadeIn,
      preventDuplicates: true,
    ),

    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingView(),
      transition: Transition.fadeIn,
      preventDuplicates: true,
    ),

    /// 404 Page
    GetPage(
      name: AppRoutes.notFound,
      page: () => const NotFoundPage(),
      transition: Transition.fadeIn,
      preventDuplicates: true,
    ),
  ];
}