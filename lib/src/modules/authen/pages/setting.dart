import 'package:doantotnghiep/src/modules/authen/component/componentsettings/settingmodels.dart';
import 'package:doantotnghiep/src/modules/authen/widgets/avatar_card.dart';
import 'package:doantotnghiep/src/modules/authen/widgets/setting_tile.dart';
import 'package:doantotnghiep/src/modules/authen/widgets/support_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AvatarCard(),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 10),
                Column(
                  children: List.generate(
                    settings.length,
                        (index) => SettingTile(setting: settings[index]),
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                Column(
                  children: List.generate(
                    settings2.length,
                        (index) => SettingTile(setting: settings2[index]),
                  ),
                ),
                const SizedBox(height: 20),
                const SupportCard()
              ],
            ),
          ),
        ),
      ),
    );
  }
}