class Hospital {
  final String localId ;
  final String name;
  final String address;
  final String tel;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int syncState;

  const Hospital ({
    required this.localId,
    required this.name,
    required this.address,
    required this.tel,
    required this.updatedAt,
    required this.deletedAt,
    required this.syncState
  });
}