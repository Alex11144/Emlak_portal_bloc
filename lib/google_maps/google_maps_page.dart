import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsPage extends StatefulWidget {
  const GoogleMapsPage({super.key});

  @override
  State<GoogleMapsPage> createState() => _GoogleMapsPageState();
}

class _GoogleMapsPageState extends State<GoogleMapsPage> {
  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng baku = LatLng(40.409264, 49.867092);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GoogleMap(
          initialCameraPosition: CameraPosition(target: baku, zoom: 14.5)),
    );
  }
}
