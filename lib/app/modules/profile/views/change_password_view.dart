import 'package:bookdianight_app/app/core/utils/custom_snack_bar.dart';

import '../../../core/resources/common_widget/custom_app_bar.dart';
import '../../../core/resources/common_widget/custom_button.dart';
import '../../../core/resources/common_widget/custom_text_field.dart';
import '../../../core/utils/resource_const.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(title: "Change Password"),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomTextField(
              label: "Previous Password",
              hint: "••••••••",
              obscureText: true,
            ),
            const SizedBox(height: 20),
            const CustomTextField(
              label: "New Password",
              hint: "••••••••",
              obscureText: true,
            ),
            const SizedBox(height: 20),
            const CustomTextField(
              label: "Confirm Password",
              hint: "••••••••",
              obscureText: true,
            ),
            const Spacer(),
            CustomButton(
              title: "Update Password",
              onTap: () {
                CustomSnackBar.success(
                  message: "Password updated successfully",
                );
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
