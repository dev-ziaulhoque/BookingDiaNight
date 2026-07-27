import 'package:flutter/material.dart';

import '../../utils/location_helpfer_function.dart';

class AddressFromCoordinates extends StatelessWidget {
  const AddressFromCoordinates({
    super.key,
    required this.lat,
    required this.lng,
    this.fallback = 'Location unavailable',
    this.style,
    this.maxLines = 1,
  });

  final double? lat;
  final double? lng;
  final String fallback;
  final TextStyle? style;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    if (lat == null || lng == null) {
      return Text(fallback, style: style, maxLines: maxLines);
    }

    return FutureBuilder<String>(
      future: LocationHelperFunction.getAddressFromLatLng(
        lat: lat!,
        lng: lng!,
      ),
      builder: (context, snapshot) => Text(
        snapshot.data ?? 'Finding address...',
        style: style,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
