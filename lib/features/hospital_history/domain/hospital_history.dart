class HospitalHistory {
  final String localId ;
  final String petId;
  final String hospitalId;
  final DateTime date;
  final String? symptom;
  final int? fee;
  final String? memo;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int syncState;

  const HospitalHistory ({
    required this.localId,
    required this.petId,
    required this.hospitalId,
    required this.date,
    required this.symptom,
    required this.fee,
    required this.memo,
    required this.updatedAt,
    required this.deletedAt,
    required this.syncState
  });
}