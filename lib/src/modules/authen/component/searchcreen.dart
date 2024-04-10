import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_helper/search_helper.dart';
import 'package:doantotnghiep/src/controller/data_controller.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/search_model.dart'; // Import the correct model

class SearchScreen extends StatelessWidget {
  final DataController dataController = DataController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              TextField(
                onChanged: (String input) {
                  if (input.isEmpty) {
                    dataController.resetBack();
                  } else {
                    var result = SearchHelper.searchModel(
                      data: dataController.post,
                      properties: ['name.firstname', 'name.lastname'], // Thêm thuộc tính firstname và lastname của name vào danh sách tìm kiếm
                      searchWord: input,
                    );

                    dataController.filterPost.value = [];
                    result.forEach((e) {
                      Map<String, dynamic> jsonMap = json.decode(e);
                      dataController.filterPost.add(SearchModel.fromJson(jsonMap)); // Corrected the class name to SearchModel
                    });
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Nhập trạm xe muốn tìm kiếm ',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: () {
                      // Clear search
                      dataController.resetBack();
                    },
                    icon: Icon(Icons.mic_rounded),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Obx(
                      () => dataController.isLoading.value
                      ? Center(
                    child: CircularProgressIndicator(),
                  )
                      : ListView.builder(
                    itemBuilder: (ctx, i) {
                      String title =
                          dataController.filterPost.value[i].title;
                      String subTitle =
                      dataController.filterPost[i].userId.toString();
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Text(subTitle),
                          ),
                          title: Text(title),
                          subtitle: Text("User id is ${subTitle}"),
                        ),
                      );
                    },
                    itemCount: dataController.filterPost.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}