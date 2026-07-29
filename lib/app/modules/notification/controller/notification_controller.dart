import 'package:get/get.dart';

class NotificationController extends GetxController {
  // Make sure it has .obs at the end
  final notifications = <NotificationModel>[
    NotificationModel(
        group: 'Today',
        time: '11:00 AM',
        title: 'Booking Confirmed',
        subtitle: 'Your booking request for Sunset Bay Hall has been confirmed!'),
    NotificationModel(
        group: 'Today',
        time: '11:00 AM',
        title: 'Payment Successful',
        subtitle: 'Your venue is reserved for June 21, 2026.'),
    NotificationModel(
        group: 'Yesterday',
        time: '11:00 AM',
        title: 'Ticket Ready',
        subtitle: 'Your event ticket for Neon Groove Fest 2026 is ready.'),
  ].obs;

  void markAllAsRead() {
    for (var n in notifications) {
      n.isRead = true;
    }
    notifications.refresh(); // This tells Obx to redraw
  }

  void markAsRead(NotificationModel item) {
    item.isRead = true;
    notifications.refresh();
  }
}

class NotificationModel {
  final String title;
  final String subtitle;
  final String time;
  final String group; // 'Today', 'Yesterday'
  bool isRead;

  NotificationModel({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.group,
    this.isRead = false,
  });
}