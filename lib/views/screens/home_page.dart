import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_coder/controllers/homepage_controller.dart';
import 'package:si_coder/core/configuration/size_config.dart';
import 'package:si_coder/core/constant/images/app_images.dart';
import 'package:si_coder/views/widgets/client_card.dart';
import 'package:si_coder/views/widgets/adherent_card.dart';

import '../../core/constant/colors/app_color.dart';
import '../../core/constant/style/text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    HomePageController homePageController = Get.put(HomePageController());
    return Scaffold(
      backgroundColor: AppColor.kBackGroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColor.kGreenColor),
        title: Text(
          "TROUVEX",
          style: titleGreenStyle(),
        ),
        leading: const Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: AppColor.kBlueColor.withOpacity(0.5),
              child: Image.asset(
                kBank,
                height: SizeConfig.screenHeight! * .03,
                width: SizeConfig.screenWidth,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth! * .07,
            vertical: SizeConfig.screenHeight! * .07,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(bottom: SizeConfig.screenHeight! * .02),
                child: Center(
                  child: Image(
                    image: const AssetImage(kLogo),
                    width: SizeConfig.screenWidth! * .5,
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(bottom: SizeConfig.screenHeight! * .01),
                child: Center(
                    child: FittedBox(
                  child: Text(
                    'Bienvenu dans \n TROUVEX ',
                    style: titleGreenStyle(),
                    textAlign: TextAlign.center,
                  ),
                )),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * .1,
              ),
              ClientCard(
                onTap: () => homePageController.navToClient(),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * .05,
              ),
              AdherentCard(
                onTap: () => homePageController.navToAdherent(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
