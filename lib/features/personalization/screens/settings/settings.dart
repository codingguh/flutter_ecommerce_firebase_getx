import 'package:bliguh/common/widgets/appbar/myprofile_appbar.dart';
import 'package:bliguh/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:bliguh/common/widgets/texts/section_heading.dart';
import 'package:bliguh/data/dummy_data.dart';
import 'package:bliguh/data/repositories/authentications/authentication_repository.dart';
import 'package:bliguh/features/personalization/controllers/settings_controller.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<Widget> settingsTiles = [];

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());
    final settingsController = AuhenticationRepository.instance;
    return Scaffold(
      appBar: MyProfileAppBar(),
      body: RefreshIndicator(
        displacement: 0, // Customize displacement if needed
        color: TColors.primary,

        onRefresh: () async {
          controller.isRefreshing(true);
          await Future.delayed(Duration(milliseconds: 1500));
          controller.isRefreshing(false);
        },
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ///--Body
              Obx(() => controller.isRefreshing.value
                  ? Center(
                      child: Text('Refreshing'),
                    )
                  : SizedBox()),
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace - 12),
                child: Column(
                  children: [
                    SectionHeading(
                      title: 'Account Settings',
                      showActionButton: false,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),

                    for (int i = 0; i < settingsList.length; i++)
                      SettingsMenuTile(
                        icon: settingsList[i]['icon'],
                        title: settingsList[i]['title'],
                        subTitle: settingsList[i]['subTitle'],
                        onTap: settingsList[i]['onPressed'],
                      ),

                    ///--Appsettings
                    SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    SectionHeading(
                      title: 'App Settings',
                      showActionButton: false,
                    ),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    for (int i = 0; i < settingsAppMenu.length; i++)
                      SettingsMenuTile(
                        icon: settingsAppMenu[i]['icon'],
                        title: settingsAppMenu[i]['title'],
                        subTitle: settingsAppMenu[i]['subTitle'],
                        onTap: settingsAppMenu[i]['onPressed'],
                        trailing: settingsAppMenu[i]['trailing'],
                      ),
                    SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    SectionHeading(
                      title: 'App Records',
                      showActionButton: false,
                    ),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    for (int i = 0; i < settingsAppRecords.length; i++)
                      SettingsMenuTile(
                        icon: settingsAppRecords[i]['icon'],
                        title: settingsAppRecords[i]['title'],
                        subTitle: settingsAppRecords[i]['subTitle'],
                        onTap: settingsAppRecords[i]['onPressed'],
                        trailing: settingsAppRecords[i]['trailing'],
                      ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: () async {
                            await settingsController.logout();
                          },
                          child: const Text(
                            'Logout',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.w800),
                          )),
                    ),
                    SizedBox(
                      height: TSizes.spaceBtwSections * 2.5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
