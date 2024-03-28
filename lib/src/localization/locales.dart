import 'package:flutter_localization/flutter_localization.dart';

const List<MapLocale> LOCALES = [
  MapLocale("en", LocaleData.EN),
  MapLocale("vi", LocaleData.VI),
];
mixin LocaleData {
  static const String titleOne = 'titleOne';
  static const String descriptionOne = 'descriptionOne';
  static const String titleTwo = 'titleTwo';
  static const String descriptionTwo = 'descriptionTwo';
  static const String titleThree = 'titleThree';
  static const String descriptionThree = 'descriptionThree';
  static const String skip = 'skip';
  static const Map<String, dynamic> VI = {
    // on dashboard
    titleOne: '1.Mở khóa',
    descriptionOne: 'Quét mã QR trên xe để xe tự động mở khóa."',
    titleTwo: '2.Đi xe"',
    descriptionTwo:
        'Trong quá trình sử dụng bạn có thể khóa xe tạm thời và mở lại bất cứ khi nào bằng ứng dụng di động.',
    titleThree: '3.Khóa xe',
    descriptionThree:
        'Trả xe đạp về trạm bất kì. Thực hiện đóng khóa xe và xác nhận kết thúc chuyến đi trên ứng dụng.',
    skip: 'Bỏ qua',
  };
  static const Map<String, dynamic> EN = {
// on dashboard
    titleOne: '1. Unlock',
    descriptionOne: 'Scan the QR code on the bike to automatically unlock it.',
    titleTwo: '2. Ride',
    descriptionTwo:
        'During usage, you can temporarily lock the bike and unlock it again anytime using the mobile app.',
    titleThree: '3. Lock',
    descriptionThree:
        'Return the bike to any station. Lock the bike and confirm the end of the trip in the app.',
    skip: "Skip"
  };
  void configureLocalization() {}
}
