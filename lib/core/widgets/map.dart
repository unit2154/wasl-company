import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:wasl_company_app/core/constants/colors.dart';
import 'package:wasl_company_app/core/dependencies/locator.dart';

class MapWidget extends StatelessWidget {
  MapWidget({super.key});

  final MapController _mapController = MapController();
  LocationData? _currentLocation;
  List<LatLng> _routePoints = [];
  List<Marker> _markers = [];
  final String _ormApiKey =
      "eyJvcmciOiI1YjNjZTM1OTc4NTExMTAwMDFjZjYyNDgiLCJpZCI6IjcwNDAwZWQ4N2RlMTQzNWZhYTQ4ZmY1NTFjODE1ZjljIiwiaCI6Im11cm11cjY0In0=";

  void _getCurrentLocation() async {
    Location location = Location();
    location.requestPermission();
    try {
      _currentLocation = await location.getLocation();
    } on Exception catch (e) {
      _currentLocation = null;
    }

    location.onLocationChanged.listen((LocationData newLocation) {
      _currentLocation = newLocation;
    });
  }

  Future<void> _getRoute(LatLng destination) async {
    if (_currentLocation == null) return;

    final start = LatLng(
      _currentLocation!.latitude!,
      _currentLocation!.longitude!,
    );
    final end = destination;

    try {
      final response = await getIt.get<Dio>().get(
        "https://api.mapbox.com/directions/v5/mapbox/driving/$start,$end?access_token=$_ormApiKey",
      );
      final coordinates = response.data['routes'][0]['geometry']['coordinates'];
      _routePoints = coordinates.map((e) => LatLng(e[1], e[0])).toList();
      _markers.add(
        Marker(
          point: end,
          width: 40,
          height: 40,
          child: const Icon(
            Icons.location_on,
            color: AppColors.primary,
            size: 40,
          ),
        ),
      );
    } on DioException catch (e) {
      print(e.response?.data);
    }
  }

  void _addDestinationMarker(LatLng destination) {
    _markers.add(
      Marker(
        point: destination,
        width: 40,
        height: 40,
        child: const Icon(
          Icons.location_on,
          color: AppColors.primary,
          size: 40,
        ),
      ),
    );
    _getRoute(destination);
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        initialCenter: LatLng(33.3232, 44.41),
        initialZoom: 11.0,
      ),
      children: [
        TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          userAgentPackageName: "com.wasl.company",
        ),
        MarkerLayer(markers: _markers),
        PolylineLayer(
          polylines: [
            Polyline(
              points: _routePoints,
              color: AppColors.primary,
              strokeWidth: 5,
            ),
          ],
        ),
      ],
    );
  }
}
