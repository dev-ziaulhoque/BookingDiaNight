import 'package:get/get.dart';
import '../../../../core/utils/resource_const.dart';

class ClubModel {
  final String image, title, location, rating, price, type;
  final List<String>? tags;

  ClubModel({
    required this.image,
    required this.title,
    required this.location,
    required this.rating,
    required this.price,
    required this.type,
    this.tags,
  });
}

class ClubController extends GetxController {

  // Tonight Near You Data
  final tonightClubs = <ClubModel>[
    ClubModel(
      image: "https://images.unsplash.com/photo-1514525253361-bee8a19740c1",
      type: "Event",
      title: "XOYO London",
      location: "Shoreditch",
      rating: "4.8",
      price: "\$65",
    ),
    ClubModel(
      image: "https://images.unsplash.com/photo-1545128485-c400e7702796",
      type: "Club",
      title: "Sky Garden Rooftop",
      location: "Shoreditch",
      rating: "4.8",
      price: "\$65",
    ),
  ].obs;

  // Popular Clubs Dummy Data
  final popularClubs = <ClubModel>[
    ClubModel(
      image: "https://images.unsplash.com/photo-1571266028243-3716f02d2d2e",
      type: "Club",
      title: "Fabric London",
      location: "Farringdon, EC1",
      rating: "4.7",
      price: "\$65",
      tags: ["VIP", "Live DJ"],
    ),
    ClubModel(
      image: "https://images.unsplash.com/photo-1566737236500-c8ac43014a67",
      type: "Club",
      title: "Annabel's Mayfair",
      location: "Mayfair, W1",
      rating: "4.9",
      price: "\$90",
      tags: ["VIP", "Luxury"],
    ),
    ClubModel(
      image: "https://images.unsplash.com/photo-1574094939444-4965d8362677",
      type: "Lounge",
      title: "The Box Soho",
      location: "Walker's Ct, Soho",
      rating: "4.6",
      price: "\$75",
      tags: ["Show", "Cocktails"],
    ),
    ClubModel(
      image: "https://images.unsplash.com/photo-1470225620780-dba8ba36b745",
      type: "Event",
      title: "Ministry of Sound",
      location: "Gaunt St, Elephant & Castle",
      rating: "4.8",
      price: "\$55",
      tags: ["Techno", "Large Dancefloor"],
    ),
    ClubModel(
      image: "https://images.unsplash.com/photo-1516450360452-9312f5e86fc7",
      type: "Club",
      title: "Cirque Le Soir",
      location: "Ganton St, Carnaby",
      rating: "4.5",
      price: "\$80",
      tags: ["VIP", "Unique"],
    ),
    ClubModel(
      image: "https://images.unsplash.com/photo-1505236858219-8359eb29e329",
      type: "Club",
      title: "Egg London",
      location: "Vale Royal, Kings Cross",
      rating: "4.4",
      price: "\$50",
      tags: ["Garden", "Underground"],
    ),
  ].obs;
}

