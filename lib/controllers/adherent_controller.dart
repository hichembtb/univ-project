import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/configuration/generator.dart';
import '../core/constant/routes/app_routes.dart';
import '../core/services/loading_service.dart';

class AdherentController extends GetxController {
  late String name;
  late String phone;
  late String wilaya;
  late String skill;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  CollectionReference adhRef =
      FirebaseFirestore.instance.collection('adherent');

  CollectionReference adhPhoneRef =
      FirebaseFirestore.instance.collection('adherentsphone');
  List<String> adhPhoneList = [];

  Future addAdh() async {
    FormState? formdata = formstate.currentState;
    if (formdata != null) {
      if (formdata.validate()) {
        formdata.save();
        if (!adhPhoneList.contains(phone)) {
          LoadingService().showLoading();
          String id = Generator().generateId();
          adhPhoneRef.doc(phone).set({"phone": phone});
          await adhRef.add({
            'id': id,
            'name': name,
            'phone': phone,
            'wilaya': wilaya,
            'skill': skill,
          }).then((value) {
            LoadingService().showSuccess("Votre Demande a été ajouter");
            Get.offNamed(AppRoute.adherentresult);
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

  void navToClients() {
    Get.toNamed(AppRoute.adherentresult);
  }

  Future fetchAdherentPhone() async {
    adhPhoneList.clear();
    QuerySnapshot<Object?> adhPhQeury = await adhPhoneRef.get();
    List<QueryDocumentSnapshot<Object?>> adhPhDocs = adhPhQeury.docs;
    for (var adhPh in adhPhDocs) {
      adhPhoneList.add(adhPh.id);
    }
  }

  @override
  void onInit() {
    fetchAdherentPhone();
    super.onInit();
  }
}
