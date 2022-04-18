import '../response_entity.dart';

abstract class ResponseEntityRecordText extends ResponseEntity {
  final String periodId;
  final DateTime? periodBeginDate;
  final DateTime? periodEndDate;
  final String languageId;
  final String languageCode;
  final String languageGlobalText;
  final String languageCultureText;
  final String reasonCodeId;
  final String reasonCodeCode;
  final String? reasonCodeDescription;
  final String? description;
  final String? shortText;
  final String? text;
  final String? longText;
  ResponseEntityRecordText({
    required String id,
    required DateTime createdDate,
    required DateTime? modifiedDate,
    required String createdUserId,
    required String? modifiedUserId,
    required this.periodId,
    required this.periodBeginDate,
    required this.periodEndDate,
    required this.languageId,
    required this.languageCode,
    required this.languageGlobalText,
    required this.languageCultureText,
    required this.reasonCodeId,
    required this.reasonCodeCode,
    required this.reasonCodeDescription,
    required this.description,
    required this.shortText,
    required this.text,
    required this.longText,
  }) : super(
          id: id,
          createdDate: createdDate,
          modifiedDate: modifiedDate,
          createdUserId: createdUserId,
          modifiedUserId: modifiedUserId,
        );
}
