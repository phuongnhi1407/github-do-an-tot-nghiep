import 'package:doantotnghiep/src/modules/authen/component/page_title_bar.dart';
import 'package:doantotnghiep/src/modules/authen/provider/authen_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AuthenProvider? authenProvider;

  @override
  void initState() {
    super.initState();
    authenProvider = Provider.of<AuthenProvider>(context, listen: false);
    handleProfile(); // Call handleProfile to fetch user information
  }

  void handleProfile() async {
    // Logic to fetch user information
    await authenProvider?.fetchProfile(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                const PageTitleBar(title: 'Thông tin cá nhân'),
                Padding(
                  padding: const EdgeInsets.only(top: 320.0),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Consumer<AuthenProvider>(
                      builder: (context, authenProvider, child) {
                        if (authenProvider.userInfo != null) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Họ và tên: ${authenProvider.userInfo!.fullName}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Email: ${authenProvider.userInfo!.email}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Add more widgets to display other user information
                              // Example: phone number, address, etc.
                            ],
                          );
                        } else {
                          // Show loading indicator or error message if user information is not available yet
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}