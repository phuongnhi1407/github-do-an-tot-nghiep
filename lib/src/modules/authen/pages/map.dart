import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(16.4637, 107.5909), // Tọa độ trung tâm bản đồ (Ví dụ: Huế)
          zoom: 12, // Mức độ zoom mặc định
        ),
        markers: _createMarkers(), // Tạo các đánh dấu trạm xe
      ),
    );
  }

  Set<Marker> _createMarkers() {
    return Set<Marker>.from([
      Marker(
        markerId: MarkerId('1'),
        position: LatLng(16.4724, 107.5898), // Vị trí trạm xe 1
        infoWindow: InfoWindow(
          title: 'Trạm Xe 1',
          snippet: 'Mô tả trạm xe 1',
        ),
      ),
      Marker(
        markerId: MarkerId('2'),
        position: LatLng(16.4649, 107.5954), // Vị trí trạm xe 2
        infoWindow: InfoWindow(
          title: 'Trạm Xe 2',
          snippet: 'Mô tả trạm xe 2',
        ),
      ),
      // Thêm các đánh dấu khác tại đây
    ]);
  }
}

void main() {
  runApp(MaterialApp(
    home: MapScreen(),
  ));
}