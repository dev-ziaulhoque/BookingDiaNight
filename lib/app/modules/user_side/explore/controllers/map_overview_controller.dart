import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


// Model
class MapPlace {
  final String id;
  final LatLng position;
  final String imageUrl;
  final Color borderColor;

  MapPlace({
    required this.id,
    required this.position,
    required this.imageUrl,
    required this.borderColor,
  });
}

// Controller
class MapOverviewController extends GetxController {
  final Completer<GoogleMapController> mapController = Completer<GoogleMapController>();

  static const CameraPosition initialPosition = CameraPosition(
    target: LatLng(41.9028, 12.4964), // Rome, Italy
    zoom: 11.5,
  );

  final RxSet<Marker> markers = <Marker>{}.obs;

  final List<MapPlace> _places = [
    MapPlace(
      id: '1',
      position: const LatLng(41.9028, 12.4964), // Colosseum Area
      imageUrl: 'https://images.unsplash.com/photo-1552832230-c0197dd311b5',
      borderColor: Colors.orange,
    ),
    MapPlace(
      id: '2',
      position: const LatLng(41.9200, 12.4700), // Vatican Area
      imageUrl: 'https://images.unsplash.com/photo-1531572753322-ad063cecc140',
      borderColor: Colors.blue,
    ),
    MapPlace(
      id: '3',
      position: const LatLng(41.8800, 12.5000), // South Rome
      imageUrl: 'https://images.unsplash.com/photo-1515542622106-78b28af7815d',
      borderColor: Colors.red,
    ),
    MapPlace(
      id: '4',
      position: const LatLng(41.9300, 12.5200), // North East
      imageUrl: 'https://images.unsplash.com/photo-1529154036614-a60975f5c760',
      borderColor: Colors.amber,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    _initMarkers();
  }

  void _initMarkers() {
    for (var place in _places) {
      markers.add(
        Marker(
          markerId: MarkerId(place.id),
          position: place.position,
          icon: BitmapDescriptor.defaultMarkerWithHue(
            place.borderColor == Colors.blue
                ? BitmapDescriptor.hueAzure
                : place.borderColor == Colors.red
                ? BitmapDescriptor.hueRed
                : BitmapDescriptor.hueOrange,
          ),
          infoWindow: const InfoWindow(title: 'Event Location'),
        ),
      );
    }
  }

  Future<void> onMapCreated(GoogleMapController controller) async {
    if (!mapController.isCompleted) {
      mapController.complete(controller);
    }
    controller.setMapStyle(_darkMapStyle);
  }

  Future<void> zoomIn() async {
    final controller = await mapController.future;
    controller.animateCamera(CameraUpdate.zoomIn());
  }

  Future<void> zoomOut() async {
    final controller = await mapController.future;
    controller.animateCamera(CameraUpdate.zoomOut());
  }

  Future<void> goToCurrentLocation() async {
    final controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(initialPosition));
  }

  final String _darkMapStyle = '''
  [
    {"elementType": "geometry", "stylers": [{"color": "#212121"}]},
    {"elementType": "labels.icon", "stylers": [{"visibility": "off"}]},
    {"elementType": "labels.text.fill", "stylers": [{"color": "#757575"}]},
    {"elementType": "labels.text.stroke", "stylers": [{"color": "#212121"}]},
    {"featureType": "administrative", "elementType": "geometry", "stylers": [{"color": "#757575"}]},
    {"featureType": "poi", "elementType": "geometry", "stylers": [{"color": "#181818"}]},
    {"featureType": "road", "elementType": "geometry", "stylers": [{"color": "#2c2c2c"}]},
    {"featureType": "water", "elementType": "geometry", "stylers": [{"color": "#000000"}]}
  ]
  ''';
}