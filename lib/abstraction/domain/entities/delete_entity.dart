class DeleteEntity{
  final String id;
  final DateTime deleteDate;
  final String? description;
  final String reasonCodeCode;
  const DeleteEntity({required this.id, required this.deleteDate, required this.reasonCodeCode, this.description,});
}