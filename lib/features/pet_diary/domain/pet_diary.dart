class PetDiary {
  final String localId;
  final String? petId;
  final DateTime date;
  final String title;
  final String content;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int syncState;

  const PetDiary ({
    required this.localId,
    required this.petId,
    required this.date,
    required this.title,
    required this.content,
    required this.updatedAt,
    required this.deletedAt,
    required this.syncState
  });
}