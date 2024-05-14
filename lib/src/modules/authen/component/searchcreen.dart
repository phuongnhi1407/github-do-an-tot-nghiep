import 'package:doantotnghiep/src/modules/authen/dtos/models/station_model.dart';
import 'package:doantotnghiep/src/modules/authen/provider/authen_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StationScreenn extends StatefulWidget {
  const StationScreenn({Key? key}) : super(key: key);

  @override
  _StationScreennState createState() => _StationScreennState();
}

class _StationScreennState extends State<StationScreenn> {
  TextEditingController searchController = TextEditingController();
  List<StationData> filteredStations = [];

  @override
  void initState() {
    super.initState();
    final authenProvider = Provider.of<AuthenProvider>(context, listen: false);
    authenProvider.fetchStation(context);
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

  @override
  Widget build(BuildContext context) {
    final authenProvider = Provider.of<AuthenProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(
          'Danh sách trạm',
          style: TextStyle(
            color: Colors.black, // Màu chữ đen
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
                      backgroundColor: Colors.lightGreen,
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
                      ],
                    ),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Colors.grey),
                    onTap: () {
                      // Xử lý khi người dùng chọn một trạm cụ thể
                      // Ví dụ: mở chi tiết trạm
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