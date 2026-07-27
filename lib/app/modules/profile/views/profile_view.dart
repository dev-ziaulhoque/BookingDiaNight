import 'package:bookdianight_app/app/modules/profile/views/personal_information_view.dart';

import '../../../core/resources/common_widget/custom_button.dart';
import '../../../core/resources/common_widget/custom_text.dart';
import '../../../core/utils/resource_const.dart';
import '../controllers/profile_controller.dart';
import '../widgets/profile_option_tile.dart';
import 'account_setting_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header with Background Image
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://images.unsplash.com/photo-1514525253361-bee8a19740c1",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    color: Colors.black.withOpacity(0.6),
                    alignment: Alignment.center,
                    child: const CustomText(
                      text: "My Profile",
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -50,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white24,
                      shape: BoxShape.circle,
                    ),
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
            Obx(
              () => CustomText(
                text: controller.userName.value,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),

            // Profile Options
            ProfileOptionTile(
              icon: Icons.person_outline,
              title: "Personal Information",
              onTap: () => Get.to(() => const PersonalInfoView()),
            ),
            ProfileOptionTile(
              icon: Icons.settings_outlined,
              title: "Account settings",
              onTap: () => Get.to(() => const AccountSettingsView()),
            ),
            ProfileOptionTile(
              icon: Icons.notifications_none,
              title: "Notifications",
              onTap: () {},
            ),
            ProfileOptionTile(
              icon: Icons.info_outline,
              title: "About Us",
              onTap: () {},
            ),
            ProfileOptionTile(
              icon: Icons.description_outlined,
              title: "Terms and Conditions",
              onTap: () {},
            ),
            ProfileOptionTile(
              icon: Icons.lock_outline,
              title: "Privacy Policy",
              onTap: () {},
            ),
            ProfileOptionTile(
              icon: Icons.logout,
              title: "Log Out",
              isLogout: true,
              onTap: () => _showLogoutSheet(),
            ),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }

  void _showLogoutSheet() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(25),
        decoration: const BoxDecoration(
          color: Color(0xFF0D0D0D),
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(Icons.logout, color: Colors.red, size: 30),
            ),
            const SizedBox(height: 20),
            const CustomText(
              text: "Are You Sure?",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 10),
            const CustomText(
              text: "Are you sure you want to Logout from your account",
              color: Colors.grey,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    title: "Cancel",
                    isGradient: false,
                    buttonColor: Colors.white10,
                    onTap: () => Get.back(),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: CustomButton(
                    title: "Logout",
                    buttonColor: Colors.red,
                    isGradient: false,
                    onTap: () => Get.find<ProfileController>().logout(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
