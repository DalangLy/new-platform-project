import '../response_entity.dart';

abstract class ResponseEntityRecord extends ResponseEntity {
  final String recordStatusTypeId;
  final String recordStatusTypeCode;
  final String reasonCodeId;
  final String reasonCodeCode;
  final String? reasonCodeDescription;
  final String periodId;
  final DateTime? periodBeginDate;
  final DateTime? periodEndDate;
  final String? description;

  ResponseEntityRecord({
    required String id,
    required DateTime createdDate,
    required DateTime? modifiedDate,
    required String createdUserId,
    required String? modifiedUserId,
    required this.recordStatusTypeId,
    required this.recordStatusTypeCode,
    required this.reasonCodeId,
    required this.reasonCodeCode,
    required this.reasonCodeDescription,
    required this.periodId,
    required this.periodBeginDate,
    required this.periodEndDate,
    required this.description,
  }) : super(
          id: id,
          createdDate: createdDate,
          modifiedDate: modifiedDate,
          createdUserId: createdUserId,
          modifiedUserId: modifiedUserId,
        );
}
