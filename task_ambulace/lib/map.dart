// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:task_ambulace/constant.dart';

class LocationMap extends StatefulWidget {
  const LocationMap({super.key});

  @override
  State<LocationMap> createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {
  Future<void> _getCurrentLocation() async {
    var location = Location();

    try {
      var userLocation = await location.getLocation();
      result = await InternetConnectionChecker().hasConnection;
      currentLoczation = userLocation;
      markers.add(Marker(
          width: 80.0,
          height: 80.0,
          point: LatLng(userLocation.latitude!, userLocation.longitude!),
          child: Icon(
            Icons.my_location,
            color: green,
            size: 40,
          )));
    } on Exception {
      currentLoczation = null;
    }
    location.onLocationChanged.listen((LocationData newLocation) {
      currentLoczation = newLocation;
      if (mounted) {
        setState(() {});
      }
    });
  }

  getRoute(LatLng destination) async {
    if (currentLoczation == null) return;

    if (result == true) {
      final start =
          LatLng(currentLoczation!.latitude!, currentLoczation!.longitude!);
      final response = await http.get(
        Uri.parse(
            'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$orsApiKey&start=${start.longitude},${start.latitude}&end=${destination.longitude},${destination.latitude}'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        final List<dynamic> coords =
            data['feature'][0]["geometry"]["coordinates"];
        setState(() {
          routePoint =
              coords.map((coords) => LatLng(coords[1], coords[0])).toList();
          markers.add(Marker(
              width: 80.0,
              height: 80.0,
              point: destination,
              child: const Icon(
                Icons.location_on,
                color: Colors.red,
                size: 40,
              )));
        });
      } else {
        if (kDebugMode) {
          print("faild");
        }
      }
    }
  }

  void addDestinationMarker(LatLng points) {
    setState(() {
      markers.add(Marker(
          width: 80.0,
          height: 80.0,
          point: points,
          child: const Icon(
            Icons.location_on,
            color: Colors.red,
            size: 40,
          )));
    });
    getRoute(points);

    if (mounted) {
      setState(() {});
    }
  }

  bool result = false;
  final MapController mapController = MapController();
  LocationData? currentLoczation;
  List<LatLng> routePoint = [];
  List<Marker> markers = [];
  final String orsApiKey =
      "5b3ce3597851110001cf6248ad3d36bfb3a34c3e8b90ad4bf0c788a4";
  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  @override
  void dispose() {
    mapController;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return currentLoczation == null
        ? const Center(child: CircularProgressIndicator())
        : result == true
            ? SizedBox(
                height: 250,
                child: FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                      initialCenter: LatLng(currentLoczation!.latitude!,
                          currentLoczation!.longitude!),
                      initialZoom: 15.0,
                      onTap: (tapPosition, point) =>
                          addDestinationMarker(point),
                    ),
                    children: [
                      TileLayer(
                        userAgentPackageName:
                            'dev.fleaflet.flutter_map.example',
                        urlTemplate:
                            "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: const ['a', 'b', 'c'],
                      ),
                      MarkerLayer(
                        markers: markers,
                      ),
                      PolylineLayer(polylines: [
                        Polyline(
                            points: routePoint, strokeWidth: 4.0, color: green),
                      ]),
                      FloatingActionButton(onPressed: () {
                        if (currentLoczation != null) {
                          mapController.move(
                              LatLng(currentLoczation!.latitude!,
                                  currentLoczation!.longitude!),
                              15.0);
                        }
                      })
                    ]),
              )
            : Container(
                height: 150,
                width: double.infinity,
                color: Colors.grey.shade300,
                child: const Icon(
                  Icons.signal_wifi_connected_no_internet_4,
                  color: Colors.red,
                  size: 40,
                ),
              );
  }
}
