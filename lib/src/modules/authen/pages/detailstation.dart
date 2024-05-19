import 'package:doantotnghiep/src/modules/authen/provider/authen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class StationDetailScreen extends StatefulWidget {
  const StationDetailScreen({Key? key}) : super(key: key);

  @override
  _StationDetailScreenState createState() => _StationDetailScreenState();
}

class _StationDetailScreenState extends State<StationDetailScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<AuthenProvider>(context, listen: false).fetchDetailStation(context);
  }

  @override
  Widget build(BuildContext context) {
    final authenProvider = Provider.of<AuthenProvider>(context);
    final dataInfo = authenProvider.dataInfo;
    final isLoading = authenProvider.isLoadingStationDetail;

    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết trạm xe'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : dataInfo != null
          ? Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tên trạm: ${dataInfo.stationName ?? 'Không có thông tin'}'),
            Text('Địa chỉ: ${dataInfo.locationName ?? 'Không có thông tin'}'),
            Text('Số lượng xe có sẵn: ${dataInfo.quantityAvaiable ?? 0}'),
            Text('Số ghế: ${dataInfo.numOfSeats ?? 0}'),
            Text('Trạng thái: ${dataInfo.statusName ?? 'Không có thông tin'}'),
            // Thêm các chi tiết khác của trạm xe ở đây
          ],
        ),
      )
          : Center(child: Text('Không có thông tin chi tiết trạm xe')),
    );
  }
}
