import '../../../../core/utils/resource_const.dart';
import '../../home/controllers/club_controller.dart' show ClubModel;

enum BookingStatus { upcoming, completed, canceled }

class BookingModel {
  final ClubModel club;
  final String date, time, tickets, venue, price, total;
  final BookingStatus status;

  BookingModel({
    required this.club, required this.date, required this.time,
    required this.tickets, required this.venue, required this.price,
    required this.total, required this.status,
  });
}

class BookingController extends GetxController {
  var selectedTab = 0.obs;

  // ডামি বুকিং ডেটা
  final allBookings = <BookingModel>[
    // --- Upcoming Bookings ---
    BookingModel(
      club: ClubModel(
        image: "https://images.unsplash.com/photo-1514525253361-bee8a19740c1",
        title: "XOYO London",
        location: "Shoreditch",
        rating: "4.8",
        price: "65",
        type: "Event",
      ),
      date: "July 12, 2026",
      time: "6 pm — 11 pm",
      tickets: "3 ticket",
      venue: "32-37 Cowper St, London EC2A 4AP",
      price: "3X\$191.00",
      total: "\$576",
      status: BookingStatus.upcoming,
    ),
    BookingModel(
      club: ClubModel(
        image: "https://images.unsplash.com/photo-1545128485-c400e7702796",
        title: "Sky Garden Rooftop",
        location: "Shoreditch",
        rating: "4.8",
        price: "80",
        type: "Club",
      ),
      date: "August 20, 2026",
      time: "9 pm — 2 am",
      tickets: "2 ticket",
      venue: "1 Sky Garden Walk, London EC3M 8AF",
      price: "2X\$80.00",
      total: "\$160",
      status: BookingStatus.upcoming,
    ),

    // --- Completed Bookings ---
    BookingModel(
      club: ClubModel(
        image: "https://images.unsplash.com/photo-1571266028243-3716f02d2d2e",
        title: "Fabric London",
        location: "Farringdon",
        rating: "4.7",
        price: "50",
        type: "Club",
      ),
      date: "June 05, 2026",
      time: "10 pm — 4 am",
      tickets: "4 ticket",
      venue: "77A Charterhouse St, London EC1M 6HJ",
      price: "4X\$50.00",
      total: "\$200",
      status: BookingStatus.completed,
    ),
    BookingModel(
      club: ClubModel(
        image: "https://images.unsplash.com/photo-1566737236500-c8ac43014a67",
        title: "Annabel's Mayfair",
        location: "Mayfair",
        rating: "4.9",
        price: "150",
        type: "VIP Lounge",
      ),
      date: "May 15, 2026",
      time: "8 pm — 1 am",
      tickets: "2 ticket",
      venue: "46 Berkeley Square, London W1J 5AT",
      price: "2X\$150.00",
      total: "\$300",
      status: BookingStatus.completed,
    ),

    // --- Canceled Bookings ---
    BookingModel(
      club: ClubModel(
        image: "https://images.unsplash.com/photo-1574094939444-4965d8362677",
        title: "The Box Soho",
        location: "Soho",
        rating: "4.6",
        price: "100",
        type: "Club",
      ),
      date: "April 10, 2026",
      time: "11 pm — 3 am",
      tickets: "1 ticket",
      venue: "11-12 Walker's Ct, London W1F 0SD",
      price: "1X\$100.00",
      total: "\$100",
      status: BookingStatus.canceled,
    ),
    BookingModel(
      club: ClubModel(
        image: "https://images.unsplash.com/photo-1505236858219-8359eb29e329",
        title: "Egg London",
        location: "Kings Cross",
        rating: "4.4",
        price: "40",
        type: "Event",
      ),
      date: "March 22, 2026",
      time: "10 pm — 6 am",
      tickets: "2 ticket",
      venue: "200 York Way, London N7 9AX",
      price: "2X\$40.00",
      total: "\$80",
      status: BookingStatus.canceled,
    ),
  ].obs;

  List<BookingModel> get filteredBookings {
    if (selectedTab.value == 0) return allBookings.where((b) => b.status == BookingStatus.upcoming).toList();
    if (selectedTab.value == 1) return allBookings.where((b) => b.status == BookingStatus.completed).toList();
    return allBookings.where((b) => b.status == BookingStatus.canceled).toList();
  }
}