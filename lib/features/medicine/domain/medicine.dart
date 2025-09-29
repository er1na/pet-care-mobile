class Medicine {
  final String localId;
  final String name;
  final String? effect;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int syncState;

  const Medicine({
    required this.localId,
    required this.name,
    required this.effect,
    required this.updatedAt,
    required this.deletedAt,
    required this.syncState
  });
}