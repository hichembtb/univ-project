import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_coder/controllers/adherent_controller.dart';
import 'package:si_coder/core/constant/style/text_style.dart';

import '../../../core/configuration/size_config.dart';
import '../../../core/constant/colors/app_color.dart';
import '../../../core/constant/images/app_images.dart';
import '../../../core/functions/validator.dart';
import '../../../core/shared/widgets/custom_main_button.dart';
import '../../../core/shared/widgets/custom_text_formfield.dart';

class AdherentPage extends StatelessWidget {
  const AdherentPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    AdherentController adherentController = Get.put(AdherentController());
    return Scaffold(
      backgroundColor: AppColor.kBackGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: adherentController.formstate,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: SizeConfig.screenHeight! * .07,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(right: SizeConfig.screenWidth! * .04),
                    child: SizedBox(
                      height: SizeConfig.screenHeight! * .2,
                      width: SizeConfig.screenWidth! * .5,
                      child: Image.asset(
                        kAdherent,
                        fit: BoxFit.fill,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * .02,
                  ),
                  const FittedBox(
                    child: Text("veuillez introduire vos information svp",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * .02,
                  ),
                  CustomTextFormField(
                    inputType: TextInputType.name,
                    obscureText: false,
                    hintText: 'nom',
                    prefixIcon: Icons.person,
                    onSaved: (value) {
                      adherentController.name = value;
                    },
                    validator: (value) => validator(value!, 3, 20, 'username'),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * .025,
                  ),
                  CustomTextFormField(
                    inputType: TextInputType.phone,
                    obscureText: false,
                    hintText: '+213 123 456 789',
                    prefixIcon: Icons.phone,
                    onSaved: (value) {
                      adherentController.phone = value;
                    },
                    validator: (value) => validator(value!, 3, 20, 'phone'),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * .025,
                  ),
                  CustomTextFormField(
                    inputType: TextInputType.name,
                    obscureText: false,
                    hintText: 'wilaya',
                    prefixIcon: Icons.place,
                    onSaved: (value) {
                      adherentController.wilaya = value;
                    },
                    validator: (value) => validator(value!, 3, 20, ''),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * .025,
                  ),
                  CustomTextFormField(
                    inputType: TextInputType.name,
                    obscureText: false,
                    hintText: 'je suis un : ',
                    prefixIcon: Icons.work,
                    onSaved: (value) {
                      adherentController.skill = value;
                    },
                    validator: (value) => validator(value!, 3, 20, ''),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * .025,
                  ),
                  InkWell(
                    onTap: () => adherentController.navToClients(),
                    child: Text(
                      'afficher la list des client disponible',
                      style: titleBlackStyle(),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * .1,
                  ),
                  CustomMainButton(
                    onPressed: () => adherentController.addAdh(),
                    actionText: 'confirm',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
