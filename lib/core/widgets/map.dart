import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:wasl_company_app/core/dependencies/locator.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final MapController mapController = MapController();
  LocationData? currentLocation;
  List<LatLng> routePoints = [];
  List<Marker> markers = [];
  final String apiKey =
      "eyJvcmciOiI1YjNjZTM1OTc4NTExMTAwMDFjZjYyNDgiLCJpZCI6IjcwNDAwZWQ4N2RlMTQzNWZhYTQ4ZmY1NTFjODE1ZjljIiwiaCI6Im11cm11cjY0In0=";

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    Location location = Location();
    location.requestPermission();
    try {
      currentLocation = await location.getLocation();
      setState(() {
        markers.add(
          Marker(
            point: LatLng(
              currentLocation!.latitude!,
              currentLocation!.longitude!,
            ),
            width: 40,
            height: 40,
            child: const Icon(Icons.location_on),
          ),
        );
      });
    } on Exception catch (e) {
      currentLocation = null;
    }

    location.onLocationChanged.listen((LocationData newLocation) {
      setState(() {
        currentLocation = newLocation;
      });
    });
  }

  Future<void> _getRoute(LatLng destination) async {
    if (currentLocation != null) return;

    final start = LatLng(
      currentLocation!.latitude!,
      currentLocation!.longitude!,
    );
    final end = destination;

    try {
      final response = await getIt.get<Dio>().get(
        "https://api.mapbox.com/directions/v5/mapbox/driving/$start,$end?access_token=$apiKey",
      );
      final coordinates = response.data['routes'][0]['geometry']['coordinates'];
      setState(() {
        routePoints = coordinates.map((e) => LatLng(e[1], e[0])).toList();
      });
    } on DioException catch (e) {
      print(e.response?.data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(initialCenter: LatLng(30.0, 30.0), initialZoom: 12.0),
      layers: [
        TileLayerOptions(
          urlTemplate:
              "https://api.mapbox.com/v4/mapbox.streets/{z}/{x}/{y}@2x.png?access_token=$apiKey",
        ),
        MarkerLayerOptions(markers: markers),
      ],
    );
  }
}
