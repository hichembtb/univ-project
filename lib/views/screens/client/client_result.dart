import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_coder/controllers/client_res_controller.dart';
import 'package:si_coder/core/shared/widgets/custom_present.dart';
import 'package:si_coder/models/adherent_model.dart';
import '../../../core/constant/colors/app_color.dart';
import '../../../core/constant/style/text_style.dart';

// ! HERE THE CLIENT WILL FIND A LIST OF AVAILABLE ADHEHRENT
class ClientResult extends StatelessWidget {
  const ClientResult({super.key});

  @override
  Widget build(BuildContext context) {
    ClientResController clientResController = Get.put(ClientResController());
    return GetBuilder<ClientResController>(
        init: ClientResController(),
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              centerTitle: true,
              iconTheme: const IconThemeData(color: AppColor.kGreenColor),
              title: Text(
                "list des adherent disponible",
                style: titleGreenStyle(),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
              child: ListView.builder(
                  itemCount: clientResController.adhInstance.length,
                  itemBuilder: (context, index) {
                    AdherentModel adh = clientResController.adhInstance[index];
                    return CustomPresent(
                      id: adh.id,
                      name: adh.name,
                      phone: adh.phone,
                      skill: adh.skill,
                      wilaya: adh.wilaya,
                    );
                  }),
            ),
          );
        });
  }
}
