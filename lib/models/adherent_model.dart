class AdherentModel {
  final String id;
  final String name;
  final String phone;
  final String wilaya;
  final String skill;

  AdherentModel(
      {required this.id,
      required this.name,
      required this.phone,
      required this.wilaya,
      required this.skill});
  factory AdherentModel.fromMap(Map<String, dynamic> data) {
    return AdherentModel(
      id: data["id"],
      name: data["name"],
      phone: data["phone"],
      wilaya: data["wilaya"],
      skill: data["skill"],
    );
  }
}
