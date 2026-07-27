import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationHelperFunction {
  static final Map<String, Future<String>> _addressCache = {};

  static Future<String> getAddressFromLatLng({
    required double lat,
    required double lng,
  }) {
    final key = '${lat.toStringAsFixed(5)},${lng.toStringAsFixed(5)}';
    return _addressCache.putIfAbsent(key, () => _resolveAddress(lat, lng));
  }

  static Future<String> _resolveAddress(double lat, double lng) async {
    try {
      final placemarks = await placemarkFromCoordinates(lat, lng);
      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        final parts = [
          place.locality,
          place.administrativeArea,
          place.country,
        ].where((part) => part?.trim().isNotEmpty == true).toSet();
        if (parts.isNotEmpty) return parts.join(', ');
      }
    } catch (_) {
      // Coordinate fallback below keeps location useful if geocoding fails.
    }
    return '${lat.toStringAsFixed(4)}, ${lng.toStringAsFixed(4)}';
  }

  static Future<String> getCurrentAreaName() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        return "Location Off";
      }

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        if (permission == LocationPermission.denied) {
          return "Permission Denied";
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return "Permission Denied Forever";
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;

        return place.locality ??
            place.subAdministrativeArea ??
            place.administrativeArea ??
            "Unknown Location";
      }

      ///if need with country
      /*if (placemarks.isNotEmpty) {
        final place = placemarks.first;

        final locality = place.locality;
        final country = place.country;

        return [
          locality,
          country,
        ]
            .where((e) => e != null && e.isNotEmpty)
            .join(', ');
      }*/

      return "Unknown Location";
    } catch (e) {
      return "Location Unavailable";
    }
  }
}
