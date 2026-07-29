import 'package:get/get.dart';
import '../../../../core/utils/resource_const.dart';
import '../../home/controllers/club_controller.dart';

class ClubDetailsController extends GetxController {
  final ClubModel clubModel;
  ClubDetailsController({required this.clubModel});

  late RxList<String> tabs;
  var selectedTabIndex = 0.obs;
  var isFavorite = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Condition: Check type to set tabs
    if (clubModel.type.toLowerCase() == 'club') {
      tabs = ['About', 'Photos', 'Tables', 'Reviews'].obs;
    } else {
      tabs = ['About', 'Address', 'Photos', 'Reviews'].obs;
    }
  }

  void changeTab(int index) {
    selectedTabIndex.value = index;
  }

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  // Dummy Data for Tables
  final List<Map<String, dynamic>> tablePackages = [
    {
      'title': 'Standard Entry',
      'price': '\$80.00',
      'capacity': '2—6 guests',
      'features': ['Priority entry', 'Access all areas', 'Welcome drink'],
    },
    {
      'title': 'VIP Table',
      'price': '\$160.00',
      'capacity': '2—10 guests',
      'features': ['Reserved table', 'Priority entry', '1 bottle included', 'Dedicated host'],
    },
    {
      'title': 'Bottle Package',
      'price': '\$240.00',
      'capacity': '4—12 guests',
      'features': ['2 premium bottles', 'Mixers included', 'Reserved sofa area', 'Priority entry', 'Dedicated server'],
    },
    {
      'title': 'Birthday Package',
      'price': '\$350.00',
      'capacity': '6—15 guests',
      'features': ['3 premium bottles', 'Birthday cake', 'Confetti cannon', 'VIP area', 'Photographer', 'Priority entry'],
    },
  ];

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
      'comment': 'I highly recommend this swapper for anyone in need of a reliable service. My overall experience with it has been exceptionally positive.',
    },
    {
      'name': 'Annisa Azalea',
      'date': '6 February 2022',
      'rating': 4,
      'comment': 'I highly recommend this swapper for anyone in need of a reliable service. My overall experience with it has been exceptionally positive.',
    },
  ];
}