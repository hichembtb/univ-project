import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:si_coder/models/client_model.dart';

class AdherentResController extends GetxController {
  List<ClientModel> clientInstance = [];

  CollectionReference clientRef =
      FirebaseFirestore.instance.collection('clients');
  List<QueryDocumentSnapshot<Object?>> adhDocs = [];

// ! Fetch the AVAILABLE ADHEHRENT
  Future fetchClients() async {
    clientInstance.clear();

    QuerySnapshot<Object?> adhQuery = await clientRef.get();

    adhDocs = adhQuery.docs;

    for (QueryDocumentSnapshot<Object?> client in adhDocs) {
      Map<String, dynamic> clientData = client.data() as Map<String, dynamic>;
      clientInstance.add(ClientModel.fromMap(clientData));

      update();
    }
  }

  @override
  void onInit() {
    fetchClients();
    super.onInit();
  }
}
