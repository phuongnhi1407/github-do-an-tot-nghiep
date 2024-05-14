import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:open_route_service/open_route_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
class MapScreen extends StatefulWidget {
  const MapScreen({Key? key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Position? _currentPosition; // Biến để lưu trữ vị trí
  LatLng? myPoint =  LatLng(16.4760518, 107.6022504);
  bool isLoading = false;

  Future<void> _getLocation() async {
    try {
      var status = await Permission.location.request();
      if (status.isGranted) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        setState(() {
          _currentPosition = position;
          // myPoint = LatLng(_currentPosition!.latitude, _currentPosition!.longitude);
          //16.4760518 : 107.6022504
          myPoint = LatLng(16.4760518, 107.6022504);
          print("lat ${_currentPosition!.latitude} : ${ _currentPosition!.longitude}") ;
        });
      } else {
        // Handle the case if permission is denied
        print('Location permission denied');
      }
    } catch (e) {
      // Handle errors
      print("Error getting location: $e");
    }
  }

  Future<bool> _checkLocationPermission() async {
    if (await Permission.location.isGranted) {
      return true;
    } else {
      var status = await Permission.location.request();
      return status.isGranted;
    }
  }

  @override
  void initState() {
    super.initState();
    _getLocation();
  }
  List<LatLng> points = [];
  List<Marker> markers = [];

  Future<void> getCoordinates(LatLng lat1, LatLng lat2) async {
    setState(() {
      isLoading = true;
    });

    final OpenRouteService client = OpenRouteService(
      apiKey: '5b3ce3597851110001cf6248a3ce3120e8ee44a1a1ecabf9e9cbc72a',
    );

    final List<ORSCoordinate> routeCoordinates =
    await client.directionsRouteCoordsGet(
      startCoordinate:
      ORSCoordinate(latitude: lat1.latitude, longitude: lat1.longitude),
      endCoordinate:
      ORSCoordinate(latitude: lat2.latitude, longitude: lat2.longitude),
    );

    final List<LatLng> routePoints = routeCoordinates
        .map((coordinate) => LatLng(coordinate.latitude, coordinate.longitude))
        .toList();

    setState(() {
      points = routePoints;
      isLoading = false;
    });
  }

  final MapController mapController = MapController();

  void _handleTap(LatLng latLng) {
    setState(() {
      if (markers.length < 2) {
        markers.add(
          Marker(
            point: latLng,
            width: 80,
            height: 80,
            // Sử dụng Draggable trực tiếp để tạo tính năng kéo và thả
            child: Draggable(
              feedback: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.location_on),
                color: Colors.black,
                iconSize: 45,
              ),
              onDragEnd: (details) {
                setState(() {
                  print(
                      "Latitude: ${latLng.latitude}, Longitude: ${latLng.longitude}");
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
      }

      if (markers.length == 2) {
        // Adicionar um pequeno atraso antes de exibir o efeito de processo
        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            isLoading = true;
          });
        });

        getCoordinates(markers[0].point, markers[1].point);

        // Calcular a extensão (bounding box) que envolve os dois pontos marcados
        LatLngBounds bounds = LatLngBounds.fromPoints(
            markers.map((marker) => marker.point).toList());
        // Fazer um zoom out para que a extensão se ajuste à tela
        mapController.fitBounds(bounds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                    // Se os marcadores estiverem vazios
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
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      markers.isEmpty ? "Marcar rota no mapa" : "Limpar rota",
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
          // FloatingActionButton(
          //   backgroundColor: Colors.black,
          //   onPressed: () {
          //     mapController.move(mapController.center, mapController.zoom + 1);
          //   },
          //   child: const Icon(
          //     Icons.add,
          //     color: Colors.white,
          //   ),
          // ),
          const SizedBox(height: 10),
          // FloatingActionButton(
          //   backgroundColor: Colors.black,
          //   onPressed: () {
          //     mapController.move(mapController.center, mapController.zoom - 1);
          //   },
          //   child: const Icon(
          //     Icons.remove,
          //     color: Colors.white,
          //   ),
          // ),
        ],
      ),
    );
  }
}