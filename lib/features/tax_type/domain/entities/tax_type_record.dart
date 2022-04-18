import '../../../../core/core_export.dart';
import 'tax_type_record_text.dart';

class TaxTypeRecord extends ResponseEntityRecord {
  final String taxTypeId;
  final String taxTypeCode;
  final double minValue;
  final double maxValue;
  final bool isPercentage;
  final List<TaxTypeRecordText> taxTypeRecordTexts;
  TaxTypeRecord({
    required String id,
    required DateTime createdDate,
    required DateTime? modifiedDate,
    required String createdUserId,
    required String? modifiedUserId,
    required String recordStatusTypeId,
    required String recordStatusTypeCode,
    required String reasonCodeId,
    required String reasonCodeCode,
    required String? reasonCodeDescription,
    required String periodId,
    required DateTime? periodBeginDate,
    required DateTime? periodEndDate,
    required String? description,
    required this.taxTypeId,
    required this.taxTypeCode,
    required this.minValue,
    required this.maxValue,
    required this.isPercentage,
    required this.taxTypeRecordTexts,
  }) : super(
          id: id,
          createdDate: createdDate,
          modifiedDate: modifiedDate,
          createdUserId: createdUserId,
          modifiedUserId: modifiedUserId,
          recordStatusTypeId: recordStatusTypeId,
          recordStatusTypeCode: recordStatusTypeCode,
          reasonCodeId: reasonCodeId,
          reasonCodeCode: reasonCodeCode,
          reasonCodeDescription: reasonCodeDescription,
          periodId: periodId,
          periodBeginDate: periodBeginDate,
          periodEndDate: periodEndDate,
          description: description,
        );
}
