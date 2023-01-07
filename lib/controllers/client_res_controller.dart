import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:si_coder/models/adherent_model.dart';

// ! HERE THE CLIENT WILL FIND A LIST OF AVAILABLE ADHEHRENT

class ClientResController extends GetxController {
  List<AdherentModel> adhInstance = [];

  CollectionReference adhRef =
      FirebaseFirestore.instance.collection('adherent');
  List<QueryDocumentSnapshot<Object?>> adhDocs = [];

// ! Fetch the AVAILABLE ADHEHRENT
  Future fetchAdh() async {
    adhInstance.clear();

    QuerySnapshot<Object?> adhQuery = await adhRef.get();

    adhDocs = adhQuery.docs;

    for (QueryDocumentSnapshot<Object?> adh in adhDocs) {
      Map<String, dynamic> adhData = adh.data() as Map<String, dynamic>;
      adhInstance.add(AdherentModel.fromMap(adhData));

      update();
    }
  }

  @override
  void onInit() {
    fetchAdh();
    super.onInit();
  }
}
