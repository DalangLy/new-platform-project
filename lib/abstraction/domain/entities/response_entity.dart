abstract class ResponseEntity {
  final String id;
  final DateTime createdDate;
  final DateTime? modifiedDate;
  final String createdUserId;
  final String? modifiedUserId;

  const ResponseEntity({
    required this.id,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdUserId,
    required this.modifiedUserId,
  });
}
