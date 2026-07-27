import 'package:get/get.dart';

class ClubDetailsController extends GetxController {
  // Tabs
  final List<String> tabs = ['About', 'Address', 'Photos', 'Reviews'];
  var selectedTabIndex = 0.obs;

  var isFavorite = false.obs;

  void changeTab(int index) {
    selectedTabIndex.value = index;
  }

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  // Dummy Data for Photos
  final List<String> photos = [
    'https://images.unsplash.com/photo-1540039155732-d688d52cb4b1',
    'https://images.unsplash.com/photo-1470229722913-7c092bcebf4b',
    'https://images.unsplash.com/photo-1516450360452-9312f5e86fc7',
    'https://images.unsplash.com/photo-1514525253161-7a46d19cd819',
    'https://images.unsplash.com/photo-1459749411175-04bf5292ceea',
    'https://images.unsplash.com/photo-1492684223066-81342ee5ff30',
  ];

  // Dummy Data for Reviews
  final List<Map<String, dynamic>> reviews = [
    {
      'name': 'Annisa Azalea',
      'date': '6 February 2026',
      'rating': 5,
      'comment':
          'I highly recommend this swapper for anyone in need of a reliable service. My overall experience with it has been exceptionally positive.',
    },
    {
      'name': 'Annisa Azalea',
      'date': '6 February 2022',
      'rating': 4,
      'comment':
          'I highly recommend this swapper for anyone in need of a reliable service. My overall experience with it has been exceptionally positive.',
    },
    {
      'name': 'Annisa Azalea',
      'date': '6 February 2022',
      'rating': 5,
      'comment':
          'I highly recommend this swapper for anyone in need of a reliable service. My overall experience with it has been exceptionally positive.',
    },
  ];
}
