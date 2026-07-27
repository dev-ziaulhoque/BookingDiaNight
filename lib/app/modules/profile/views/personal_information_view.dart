import '../../../core/resources/common_widget/custom_app_bar.dart';
import '../../../core/resources/common_widget/custom_button.dart';
import '../../../core/resources/common_widget/custom_text_field.dart';
import '../../../core/utils/custom_snack_bar.dart';
import '../../../core/utils/resource_const.dart';
import '../controllers/profile_controller.dart';

class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(title: "Personal Information"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            CustomTextField(
              label: "Name",
              hint: "Enter your name",
              controller: TextEditingController(
                text: controller.userName.value,
              ),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              label: "Email",
              hint: "Enter your email",
              controller: TextEditingController(
                text: controller.userEmail.value,
              ),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              label: "Phone Number",
              hint: "Enter phone number",
              controller: TextEditingController(
                text: controller.userPhone.value,
              ),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              label: "Location",
              hint: "Enter location",
              controller: TextEditingController(
                text: controller.userLocation.value,
              ),
            ),
            const SizedBox(height: 40),
            CustomButton(
              title: "Save Changes",
              onTap: () {
                CustomSnackBar.success(message: 'Changes saved successfully');
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
