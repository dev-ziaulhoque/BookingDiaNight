import 'package:flutter/material.dart';
import '../../../core/resources/common_style/extention.dart';
import '../../../core/resources/common_widget/build_app_bar.dart';
import '../../../core/resources/common_widget/gradient_scaffold.dart';
import '../widgets/notification_card.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: Column(
        children: [
          BuildAppBar(title: 'Notifications'),
          10.heightBox,
          Expanded(
            child: ListView.builder(
              itemCount: 12,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
                return NotificationCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
