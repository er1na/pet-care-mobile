class MedicineHistory {
  final String localId ;
  final String petId;
  final String hospitalId;
  final String medicineId;
  final DateTime date;
  final String? memo;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int syncState;

  const MedicineHistory ({
    required this.localId,
    required this.petId,
    required this.hospitalId,
    required this.medicineId,
    required this.date,
    required this.memo,
    required this.updatedAt,
    required this.deletedAt,
    required this.syncState
  });
}