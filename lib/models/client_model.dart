class ClientModel {
  final String id;
  final String name;
  final String phone;
  final String wilaya;
  final String need;

  ClientModel(
      {required this.id,
      required this.name,
      required this.phone,
      required this.wilaya,
      required this.need});
  factory ClientModel.fromMap(Map<String, dynamic> data) {
    return ClientModel(
      id: data["id"],
      name: data["name"],
      phone: data["phone"],
      wilaya: data["wilaya"],
      need: data["need"],
    );
  }
}
