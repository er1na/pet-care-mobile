class Vaccine {
  final String localId ;
  final String name;
  final String? memo;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int syncState;

  const Vaccine ({
    required this.localId,
    required this.name,
    required this.memo,
    required this.updatedAt,
    required this.deletedAt,
    required this.syncState
  });
}