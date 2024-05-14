import 'package:doantotnghiep/src/modules/authen/component/searchcreen.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StationScreenn()),
        );
      },
      readOnly: true,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
          size: 26,
        ),
        suffixIcon: const Icon(
          Icons.mic,
          color: Colors.blue, // Thay đổi màu sắc tùy theo nhu cầu
          size: 26,
        ),
        labelText: "Tìm kiếm trạm xe",
        labelStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        isDense: true,
      ),
    );
  }
}