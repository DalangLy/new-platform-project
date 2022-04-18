import '../../../../core/core_export.dart';
import '../../tax_type_export.dart';

class TaxTypeModel extends TaxType {
  final List<TaxTypeRecordModel> taxTypeRecordsModel;

  TaxTypeModel({
    required String id,
    required DateTime createdDate,
    required DateTime? modifiedDate,
    required String createdUserId,
    required String? modifiedUserId,
    required String code,
    required String? description,
    required this.taxTypeRecordsModel,
  }) : super(
          id: id,
          createdDate: createdDate,
          modifiedDate: modifiedDate,
          createdUserId: createdUserId,
          modifiedUserId: modifiedUserId,
          code: code,
          description: description,
          taxTypeRecords: taxTypeRecordsModel,
        );

  factory TaxTypeModel.fromJson({required Map<String, dynamic> json}) {
    try {
      final List<TaxTypeRecordModel> records = json['ttrecords'] == null ? [] : (json['ttrecords'] as List<dynamic>).map((e) => TaxTypeRecordModel.fromJson(json: e)).toList();
      return TaxTypeModel(
        id: json['id'] as String,
        createdDate: DateTime.parse(json['cd'] as String),
        modifiedDate: json['md'] == null ? null : DateTime.parse(json['md'] as String),
        createdUserId: json['cuid'] as String,
        modifiedUserId: json['muid'] as String?,
        code: json['code'] as String,
        description: json['desc'] as String?,
        taxTypeRecordsModel: records,
      );
    } on Failure {
      rethrow;
    } catch (e) {
      throw SerializeJsonFailure(message: e.toString());
    }
  }
}
