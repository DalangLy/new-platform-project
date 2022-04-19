import '../../../../abstraction/abstraction_export.dart';
import 'tax_type_record.dart';

class TaxType extends ResponseEntityWithCodeAndDesc {
  final List<TaxTypeRecord> taxTypeRecords;
  TaxType({
    required String id,
    required DateTime createdDate,
    required DateTime? modifiedDate,
    required String createdUserId,
    required String? modifiedUserId,
    required String code,
    required String? description,
    required this.taxTypeRecords,
  }) : super(
          id: id,
          createdDate: createdDate,
          modifiedDate: modifiedDate,
          createdUserId: createdUserId,
          modifiedUserId: modifiedUserId,
          code: code,
          description: description,
        );
}
