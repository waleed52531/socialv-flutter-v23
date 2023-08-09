import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:socialv/configs.dart';
import 'package:socialv/main.dart';
import 'package:socialv/screens/dashboard_screen.dart';
import 'package:socialv/screens/groups/screens/group_screen.dart';
import 'package:socialv/screens/post/screens/add_post_screen.dart';
import 'package:socialv/screens/post/screens/social_links.dart';
import 'package:socialv/screens/profile/components/custom_card_button.dart';
import 'package:socialv/screens/profile/components/custom_text.dart';
import 'package:socialv/screens/profile/screens/edit_profile_screen.dart';
import 'package:socialv/screens/profile/screens/profile_friends_screen.dart';
import 'package:socialv/screens/settings/screens/profile_information_screen.dart';
import 'package:socialv/screens/settings/screens/settings_screen.dart';
import 'package:socialv/utils/common.dart';
import 'package:socialv/utils/constants.dart';
import 'package:socialv/utils/images.dart';

class AllLinksScreen extends StatefulWidget {
  const AllLinksScreen({super.key});

  @override
  State<AllLinksScreen> createState() => _AllLinksScreenState();
}

class _AllLinksScreenState extends State<AllLinksScreen> {

  late TabController tabController;

  @override
  Widget build(BuildContext context) {
    return DoublePressBackWidget(
      onWillPop: () {
        if (selectedIndex != 0) {
          selectedIndex = 0;
          tabController.index = 0;
          setState(() {});
          return Future.value(true);
        }
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(APP_ICON, width: 28),
              4.width,
              Text(APP_NAME, style: boldTextStyle(color: context.primaryColor, size: 24, fontFamily: fontFamily)),
            ],
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0, top: 64.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomCardButton(
                            onPress: () {
                              DashboardScreen().launch(context).then((value) {
                                if (value ?? false) {
                                  selectedIndex = 0;
                                  tabController.index = 0;
                                  setState(() {});
                                }
                              });
                            },
                            label: "Dashboard", foregroundColor: context.primaryColor,
                            icon:  Icon(
                              Icons.dashboard,color: context.primaryColor
                            )
                            ),
                        CustomCardButton(
                            onPress: () {
                              SettingsScreen().launch(context).then((value) {
                                if (value ?? false) {
                                  setState(() {});
                                }
                              });
                            },
                            label: "Setting",foregroundColor: context.primaryColor,
                            icon: Icon(
                                Icons.settings,color: context.primaryColor
                            )
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomCardButton(
                            onPress: () {
                              ProfileFriendsScreen().launch(context).then((value) {
                                if (value ?? false) {
                                  setState(() {});
                                }
                              });

                            },
                            label: "Friends",foregroundColor: context.primaryColor,
                            icon:  Icon(
                              Icons.group_add,color: context.primaryColor
                            )
                            ),
                        CustomCardButton(
                            onPress: () {
                              GroupScreen().launch(context).then((value) {
                                if (value ?? false) {
                                  setState(() {});
                                }
                              });
                            },
                            label: "Group",foregroundColor: context.primaryColor,
                            icon:  Icon(
                                Icons.group,color: context.primaryColor
                            )
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomCardButton(
                            onPress: () {
                              LinkPage().launch(context).then((value){
                                if(value ?? false){
                                  setState(() {});
                                }
                              });
                            },
                            label: "Links",foregroundColor:  context.primaryColor,
                            icon:  Icon(
                                Icons.link,color: context.primaryColor
                            )
                        ),
                        CustomCardButton(
                            onPress: () {
                              ProfileDetailScreen().launch(context).then((value) {
                                if (value ?? false) {
                                  setState(() {});
                                }
                              });
                            },
                            label: "Profile",foregroundColor: context.primaryColor,
                            icon: Icon(
                                Icons.person,color: context.primaryColor
                            )
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomCardButton(
                        onPress: () {
                          EditProfileScreen().launch(context).then((value) {
                            if (value ?? false) {
                              setState(() {});
                            }
                          });
                        },
                        label: "Message",foregroundColor: context.primaryColor,
                        icon: Icon(
                            Icons.message,
                          color: context.primaryColor,
                        )
                    ),

                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
