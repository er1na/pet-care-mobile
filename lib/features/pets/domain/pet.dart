class Pet {
  final String localId;
  final String name;
  final String kind;
  final int sex;
  final DateTime? birthdate;
  final List<String>? chronicIllness;
  final String? iconId;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int syncState;

  const Pet ({
    required this.localId,
    required this.name,
    required this.kind,
    required this.sex,
    required this.birthdate,
    required this.chronicIllness,
    required this.iconId,
    required this.updatedAt,
    required this.deletedAt,
    required this.syncState
  });
}