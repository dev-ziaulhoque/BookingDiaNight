import 'package:get/get.dart';

class OwnerHomeController extends GetxController {
  // Overview Data
  final List<Map<String, dynamic>> overviewData = [
    {'icon': 'wallet', 'value': '\$450.00', 'label': 'Today\'s Revenue'},
    {'icon': 'table', 'value': '12', 'label': 'Table Booked'},
    {'icon': 'calendar', 'value': '46', 'label': 'Event Booking'},
    {'icon': 'ticket', 'value': '146', 'label': 'Tickets Sold'},
  ];

  // Recent Bookings Data
  final List<Map<String, dynamic>> recentBookings = [
    {
      'image': 'https://images.unsplash.com/photo-1540039155732-d688d52cb4b1',
      'title': 'XOYO London',
      'location': 'Farringdon, EC1',
      'tags': ['VIP', 'Live DJ'],
    },
    {
      'image': 'https://images.unsplash.com/photo-1514525253161-7a46d19cd819',
      'title': 'Fabric London',
      'location': 'Farringdon, EC1',
      'tags': ['VIP', 'Live DJ'],
    },
  ];

  // Recent Payments Data
  final List<Map<String, dynamic>> recentPayments = [
    {
      'title': 'Tech Conference Event',
      'subtitle': 'John Smith • 2 hours ago',
      'amount': '+\$150',
    },
    {
      'title': 'Tech Conference Event',
      'subtitle': 'John Smith • 2 hours ago',
      'amount': '+\$150',
    },
    {
      'title': 'Tech Conference Event',
      'subtitle': 'John Smith • 2 hours ago',
      'amount': '+\$150',
    },
    {
      'title': 'Tech Conference Event',
      'subtitle': 'John Smith • 2 hours ago',
      'amount': '+\$150',
    },
  ];
}
