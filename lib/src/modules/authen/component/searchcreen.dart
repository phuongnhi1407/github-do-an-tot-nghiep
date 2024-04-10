import 'package:doantotnghiep/src/controller/data_controller.dart';
import 'package:doantotnghiep/src/modules/authen/dtos/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_helper/search_helper.dart';


class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DataController dataController = Get.put(DataController(), permanent: true);
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              children: [
                TextField(
                  onChanged: (String input) {
                    if (input.isEmpty) {
                      dataController.resetBack();
                    } else {
                      var result = SearchHelper.searchModel(
                        data: dataController.post,
                        properties: ['title', 'userId'],
                        searchWord: input,
                      );
                      dataController.filterPost.value = [];
                      result.forEach((e) {
                        dataController.filterPost.add(PostModel.fromJson(e));
                      });
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Search here...',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      onPressed: () {
                        // Clear search
                        dataController.resetBack();
                      },
                      icon: Icon(Icons.mic_rounded),
                    ),gi
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: Obx(() => dataController.isLoading.value
                        ? Center(
                      child: CircularProgressIndicator(),
                    )
                        : ListView.builder(
                      itemBuilder: (ctx, i) {
                        String title =
                            dataController.filterPost.value[i].title;
                        String subTitle = dataController.filterPost[i].userId.toString();
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
                    ))),
              ],
            ),
          ),
        ));
  }
}