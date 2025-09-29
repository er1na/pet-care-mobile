class VaccineHistory {
  final String localId ;
  final String petId;
  final String hospitalId;
  final String vaccineId;
  final DateTime date;
  final String? memo;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int syncState;

  const VaccineHistory ({
    required this.localId,
    required this.petId,
    required this.hospitalId,
    required this.vaccineId,
    required this.date,
    required this.memo,
    required this.updatedAt,
    required this.deletedAt,
    required this.syncState
  });
}