import 'package:doantotnghiep/src/modules/authen/dtos/models/listbikeinstation_model.dart';
import 'package:doantotnghiep/src/modules/authen/provider/authen_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StationBikeScreen extends StatelessWidget {
  final int locationId;

  const StationBikeScreen({Key? key, required this.locationId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authenProvider = Provider.of<AuthenProvider>(context);

    // Gọi phương thức fetchStationBike để lấy danh sách xe từ API dựa trên locationId
    authenProvider.fetchStationBike(context, locationId);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(
          'Thông tin xe đạp',
          style: TextStyle(
            color: Colors.black, // Màu chữ đen
            fontSize: 20, // Kích thước chữ lớn hơn
            fontWeight: FontWeight.bold, // Chữ đậm
          ),
        ),
        centerTitle: true, // Căn giữa tiêu đề của AppBar
      ),
      body: authenProvider.isLoadingStationBike
          ? Center(
        child: CircularProgressIndicator(),
      )
          : authenProvider.stationListBike != null
          ? ListView.builder(
        itemCount: authenProvider.stationListBike!.length,
        itemBuilder: (context, index) {
          final ListBikeData stationBike = authenProvider.stationListBike![index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(15),
              leading: CircleAvatar(
                backgroundColor: Colors.lightGreen,
                child: Icon(Icons.directions_bike_outlined, color: Colors.white),
              ),
              title: Text(
                stationBike.bikeName ?? '',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text('Trạm: ${stationBike.stationName ?? ''}'),
                  SizedBox(height: 5),
                  Text('Trạng thái: ${stationBike.statusName ?? ''}'),
                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
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
    );
  }
}
