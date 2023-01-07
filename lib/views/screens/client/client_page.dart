import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_coder/controllers/client_controller.dart';
import 'package:si_coder/core/configuration/size_config.dart';
import 'package:si_coder/core/constant/colors/app_color.dart';
import 'package:si_coder/core/functions/validator.dart';
import 'package:si_coder/core/shared/widgets/custom_main_button.dart';
import 'package:si_coder/core/shared/widgets/custom_text_formfield.dart';
import '../../../core/constant/images/app_images.dart';
import '../../../core/constant/style/text_style.dart';

class ClientPage extends StatelessWidget {
  const ClientPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    ClientController clientController = Get.put(ClientController());
    return Scaffold(
      backgroundColor: AppColor.kBackGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: clientController.formstate,
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
                        kClient,
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
                      clientController.name = value;
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
                      clientController.phone = value;
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
                      clientController.wilaya = value;
                    },
                    validator: (value) => validator(value!, 3, 20, ''),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * .025,
                  ),
                  CustomTextFormField(
                    inputType: TextInputType.name,
                    obscureText: false,
                    hintText: 'je cherche un : ',
                    prefixIcon: Icons.work,
                    onSaved: (value) {
                      clientController.need = value;
                    },
                    validator: (value) => validator(value!, 3, 20, ''),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * .025,
                  ),
                  InkWell(
                    onTap: () => clientController.navToAdh(),
                    child: Text(
                      'afficher la list des adherent disponible',
                      style: titleBlackStyle(),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * .1,
                  ),
                  CustomMainButton(
                    onPressed: () => clientController.addClient(),
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
