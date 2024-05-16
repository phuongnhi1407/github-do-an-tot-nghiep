import 'package:doantotnghiep/src/modules/authen/dtos/models/station_model.dart';
import 'package:doantotnghiep/src/modules/authen/pages/bike.dart';
import 'package:doantotnghiep/src/modules/authen/provider/authen_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';


class StationScreen extends StatefulWidget {
  const StationScreen({Key? key}) : super(key: key);

  @override
  _StationScreenState createState() => _StationScreenState();
}

class _StationScreenState extends State<StationScreen> {
  TextEditingController searchController = TextEditingController();
  List<StationData> filteredStations = [];

  @override
  void initState() {
    super.initState();
    final authenProvider = Provider.of<AuthenProvider>(context, listen: false);
    authenProvider.fetchStation(context).then((_) {
      findNearestStations();
    });
  }

  void filterStations(String query, List<StationData> stations) {
    if (query.isEmpty) {
      setState(() {
        filteredStations = stations;
      });
    } else {
      List<StationData> tempList = [];
      stations.forEach((station) {
        if (station.stationName != null &&
            station.stationName!.toLowerCase().contains(query.toLowerCase())) {
          tempList.add(station);
        }
      });
      setState(() {
        filteredStations = tempList;
      });
    }
  }

  Future<void> findNearestStations() async {
    final authenProvider = Provider.of<AuthenProvider>(context, listen: false);
    Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    List<StationData> stationsWithDistance = [];

    authenProvider.stationList?.forEach((station) {
      if (station.latitude != null && station.longitude != null) {
        double distance = Geolocator.distanceBetween(
          currentPosition.latitude,
          currentPosition.longitude,
          station.latitude!,
          station.longitude!,
        );
        station.distance = distance; // Thêm thuộc tính distance vào StationData
        stationsWithDistance.add(station);
      }
    });

    // Sắp xếp danh sách các trạm xe theo khoảng cách từ gần đến xa
    stationsWithDistance.sort((a, b) => a.distance!.compareTo(b.distance!));

    setState(() {
      filteredStations = stationsWithDistance;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authenProvider = Provider.of<AuthenProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Danh sách trạm xe gần nhất',
          style: TextStyle(
            color: Colors.white, // Màu chữ trắng
            fontSize: 20, // Kích thước chữ lớn hơn
            fontWeight: FontWeight.bold, // Chữ đậm
          ),
        ),
        centerTitle: true, // Căn giữa tiêu đề của AppBar
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Nhập trạm xe muốn tìm kiếm',
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    searchController.clear();
                    filterStations('', authenProvider.stationList ?? []);
                  },
                ),
              ),
              onChanged: (query) {
                filterStations(query, authenProvider.stationList ?? []);
              },
            ),
          ),
          Expanded(
            child: authenProvider.isLoadingStation
                ? Center(
              child: CircularProgressIndicator(),
            )
                : authenProvider.stationList != null
                ? ListView.builder(
              itemCount: filteredStations.length,
              itemBuilder: (context, index) {
                final StationData station = filteredStations[index];
                return Card(
                  margin: EdgeInsets.symmetric(
                      vertical: 10, horizontal: 15),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(15),
                    leading: CircleAvatar(
                      backgroundColor: Colors.teal,
                      child: Icon(Icons.directions_bike_outlined,
                          color: Colors.white),
                    ),
                    title: Text(
                      station.stationName ?? '',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text(
                            'Số lượng xe: ${station.quantityAvaiable ?? ''}'),
                        SizedBox(height: 5),
                        Text(
                            'Vị trí: ${station.locationName ?? ''}'),
                        if (station.distance != null)
                          Text(
                              'Khoảng cách: ${station.distance!.toStringAsFixed(2)} m'),
                      ],
                    ),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Colors.grey),
                    onTap: () {
                      // Điều hướng đến màn hình chi tiết
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StationBikeScreen(
                            stationId: station.id!, // Truyền ID trạm xe
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            )
                : Center(
              child: Text(
                authenProvider.errorMessage ?? 'Không có trạm nào',
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
