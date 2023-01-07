import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_coder/core/configuration/generator.dart';
import '../core/constant/routes/app_routes.dart';
import '../core/services/loading_service.dart';

class ClientController extends GetxController {
  late String name;
  late String phone;
  late String wilaya;
  late String need;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  CollectionReference clientRef =
      FirebaseFirestore.instance.collection('clients');

  CollectionReference clientPhoneRef =
      FirebaseFirestore.instance.collection('clientsphone');
  List<String> clientPhoneList = [];

  Future addClient() async {
    FormState? formdata = formstate.currentState;

    if (formdata != null) {
      if (formdata.validate()) {
        formdata.save();
        if (!clientPhoneList.contains(phone)) {
          LoadingService().showLoading();
          String id = Generator().generateId();
          clientPhoneRef.doc(phone).set({"phone": phone});
          await clientRef.add({
            'id': id,
            'name': name,
            'phone': phone,
            'wilaya': wilaya,
            'need': need,
          }).then((value) {
            LoadingService().showSuccess("Votre Demande a été ajouter");
            Get.offNamed(AppRoute.clientresult);
          }).catchError(
            (error) {
              LoadingService().showError("Internet Problem ");
            },
          );
        } else {
          LoadingService().showError("numéro de téléphone déjà utilisé !! ");
        }
      }
    }
  }

  void navToAdh() {
    Get.toNamed(AppRoute.clientresult);
  }

  Future fetchClientPhone() async {
    clientPhoneList.clear();
    QuerySnapshot<Object?> clientPhQeury = await clientPhoneRef.get();
    List<QueryDocumentSnapshot<Object?>> clientPhDocs = clientPhQeury.docs;
    for (var cleintPh in clientPhDocs) {
      clientPhoneList.add(cleintPh.id);
    }
  }

  @override
  void onInit() {
    fetchClientPhone();
    super.onInit();
  }
}
