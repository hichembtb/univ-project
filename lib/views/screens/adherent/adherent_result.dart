import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_coder/models/client_model.dart';
import '../../../controllers/adherent_res_controller.dart';
import '../../../core/constant/colors/app_color.dart';
import '../../../core/constant/style/text_style.dart';
import '../../../core/shared/widgets/custom_present.dart';

// ! HERE THE ADHEHRENT WILL FIND A LIST OF  CLIENTS

class AdherentResult extends StatelessWidget {
  const AdherentResult({super.key});

  @override
  Widget build(BuildContext context) {
    AdherentResController adherentResController =
        Get.put(AdherentResController());
    return GetBuilder(
      init: AdherentResController(),
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
            iconTheme: const IconThemeData(color: AppColor.kGreenColor),
            title: Text(
              "list des clients disponible",
              style: titleGreenStyle(),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
            child: ListView.builder(
              itemCount: adherentResController.clientInstance.length,
              itemBuilder: (context, index) {
                ClientModel client =
                    adherentResController.clientInstance[index];
                return CustomPresent(
                  id: client.id,
                  name: client.name,
                  phone: client.phone,
                  skill: 'cherche : ${client.need}',
                  wilaya: client.wilaya,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
