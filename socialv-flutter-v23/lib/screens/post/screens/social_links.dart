import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:socialv/configs.dart';
import 'package:socialv/main.dart';
import 'package:socialv/screens/profile/components/custom_text.dart';
import 'package:socialv/utils/common.dart';

class LinkPage extends StatefulWidget {
  const LinkPage({Key? key}) : super(key: key);

  @override
  State<LinkPage> createState() => _LinkPageState();
}

class _LinkPageState extends State<LinkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Links", style: boldTextStyle(size: 20)),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: context.iconColor),
          onPressed: () {
            finish(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Padding(
                padding:
                const EdgeInsets.only(left: 10.0, top: 20.0, bottom: 10.0),
                child: CustomText(
                  label: "Useful Links", fontweight: FontWeight.bold, ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextButton(
                        onPressed: () {
                          if (!appStore.isLoading)
                            openWebPage(context, url: GOOGLE_URL);
                        },
                        child: CustomText(
                            label: "Google", fontweight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          if (!appStore.isLoading)
                            openWebPage(context, url: YOUTUBE_URL);
                        },
                        child: CustomText(
                            label: "Youtube", fontweight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          if (!appStore.isLoading)
                            openWebPage(context, url: SUPPORT_URL);
                        },
                        child: CustomText(
                            label: "Help & Support",
                            fontweight: FontWeight.bold),
                      ),
                    ],
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