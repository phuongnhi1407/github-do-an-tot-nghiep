import 'package:doantotnghiep/src/modules/authen/dtos/models/listbikeinstation_model.dart';
import 'package:doantotnghiep/src/modules/authen/provider/authen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StationBikeScreen extends StatelessWidget {
  final int stationId; // Thêm ID trạm để lấy thông tin chi tiết

  const StationBikeScreen({Key? key, required this.stationId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authenProvider = Provider.of<AuthenProvider>(context);

    // Gọi phương thức fetchStationBike để lấy danh sách xe đạp từ API
    authenProvider.fetchStationBike(context, stationId);

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
          final ListBikeData stationbike =
          authenProvider.stationListBike![index];
          return Card(
            margin:
            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                stationbike.bikeName ?? '',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text('Trạm: ${stationbike.stationName ?? ''}'),
                  SizedBox(height: 5),
                  Text('Trạng thái: ${stationbike.statusName ?? ''}'),
                ],
              ),
              trailing:
              Icon(Icons.arrow_forward_ios, color: Colors.grey),
              onTap: () {
                // Xử lý khi người dùng chọn một xe đạp cụ thể
                // Ví dụ: mở chi tiết xe đạp
              },
            ),
          );
        },
      )
          : Center(
        child: Text(
          authenProvider.errorMessage ?? 'Không có xe đạp nào',
          style: TextStyle(fontSize: 16, color: Colors.red),
        ),
      ),
    );
  }
}