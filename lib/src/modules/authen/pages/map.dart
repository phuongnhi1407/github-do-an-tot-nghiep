import 'dart:async';
import 'dart:ui';
import 'package:doantotnghiep/src/modules/authen/provider/authen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:open_route_service/open_route_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart'; // Import provider

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Position? _currentPosition;
  LatLng? myPoint;
  bool isLoading = false;

  Future<void> _getLocation() async {
    try {
      var status = await Permission.location.request();
      if (status.isGranted) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        setState(() {
          _currentPosition = position;
          myPoint = LatLng(_currentPosition!.latitude, _currentPosition!.longitude);
        });
      } else {
        print('Location permission denied');
      }
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _getLocation();
    context.read<AuthenProvider>().fetchStationn(); // Fetch stations on init
  }

  List<LatLng> points = [];
  List<Marker> markers = [];
  final MapController mapController = MapController();

  Future<void> getCoordinates(LatLng lat2) async {
    setState(() {
      isLoading = true;
    });

    final OpenRouteService client = OpenRouteService(
      apiKey: '5b3ce3597851110001cf6248a3ce3120e8ee44a1a1ecabf9e9cbc72a',
    );

    final List<ORSCoordinate> routeCoordinates = await client.directionsRouteCoordsGet(
      startCoordinate: ORSCoordinate(
          latitude: _currentPosition!.latitude,
          longitude: _currentPosition!.longitude),
      endCoordinate: ORSCoordinate(latitude: lat2.latitude, longitude: lat2.longitude),
    );

    final List<LatLng> routePoints = routeCoordinates
        .map((coordinate) => LatLng(coordinate.latitude, coordinate.longitude))
        .toList();

    setState(() {
      points = routePoints;
      isLoading = false;
    });
  }

  void _handleTap(LatLng latLng) {
    markers = [];
    setState(() {
      if (markers.length < 1) {
        markers.add(
          Marker(
            point: latLng,
            width: 80,
            height: 80,
            child: Draggable(
              feedback: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.location_on),
                color: Colors.black,
                iconSize: 45,
              ),
              onDragEnd: (details) {
                setState(() {
                  print("Latitude: ${latLng.latitude}, Longitude: ${latLng.longitude}");
                });
              },
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.location_on),
                color: Colors.black,
                iconSize: 45,
              ),
            ),
          ),
        );
      }

      if (markers.length == 1) {
        double zoomLevel = 16.5;
        mapController.move(latLng, zoomLevel);
        getCoordinates(markers[0].point);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final stationnList = context.watch<AuthenProvider>().stationnList;

    return Scaffold(
      body: myPoint == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              zoom: 16,
              center: myPoint,
              onTap: (tapPosition, latLng) => _handleTap(latLng),
            ),
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                userAgentPackageName: 'dev.fleaflet.flutter_map.example',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
                    width: 200,
                    height: 200,
                    child: Icon(
                      Icons.location_on,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              if (stationnList != null && stationnList.isNotEmpty)
                MarkerLayer(
                  markers: stationnList.map((station) {
                    if (station.latitude != null && station.longitude != null) {
                      return Marker(
                        point: LatLng(station.latitude!, station.longitude!),
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.directions_bike_sharp,
                          color: Colors.red,
                          size: 30,
                        ),
                      );
                    } else {
                      return Marker(
                        point: LatLng(0, 0),
                        width: 100,
                        height: 50,
                        child: Container(),
                      );
                    }
                  }).toList(),
                )
              else if (stationnList == null)
                Center(child: Text("Fetching stations...")),
              MarkerLayer(
                markers: markers,
              ),
              PolylineLayer(
                polylineCulling: false,
                polylines: [
                  Polyline(
                    points: points,
                    color: Colors.black,
                    strokeWidth: 5,
                  ),
                ],
              ),
            ],
          ),
          Visibility(
            visible: isLoading,
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 20.0,
            left: MediaQuery.of(context).size.width / 2 - 110,
            child: Align(
              child: TextButton(
                onPressed: () {
                  if (markers.isEmpty) {
                    print('Marcar rota no mapa');
                  } else {
                    setState(() {
                      markers = [];
                      points = [];
                    });
                  }
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.black, borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      markers.isEmpty ? "Lựa chọn tuyến đường" : "Xóa tuyến đường",
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
