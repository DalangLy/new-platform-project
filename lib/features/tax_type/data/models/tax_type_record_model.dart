import '../../../../abstraction/abstraction_export.dart';
import '../../../../core/core_export.dart';
import '../../tax_type_export.dart';

class TaxTypeRecordModel extends TaxTypeRecord {
  final List<TaxTypeRecordTextModel> taxTypeRecordTextsModel;

  TaxTypeRecordModel({
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
    required String taxTypeId,
    required String taxTypeCode,
    required double minValue,
    required double maxValue,
    required bool isPercentage,
    required this.taxTypeRecordTextsModel,
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
    taxTypeId: taxTypeId,
    taxTypeCode: taxTypeCode,
    minValue: minValue,
    maxValue: maxValue,
    isPercentage: isPercentage,
    taxTypeRecordTexts: taxTypeRecordTextsModel,
  );

  factory TaxTypeRecordModel.fromJson({required Map<String, dynamic> json}){
    try {
      final List<TaxTypeRecordTextModel> texts = json['ttrtexts'] == null ? [] : (json['ttrtexts'] as List<dynamic>).map((e) => TaxTypeRecordTextModel.fromJson(json: e)).toList();
      return TaxTypeRecordModel(
        id: json['id'] as String,
        createdDate: DateTime.parse(json['cd'] as String),
        modifiedDate: json['md'] == null ? null : DateTime.parse(json['md'] as String),
        createdUserId: json['cuid'] as String,
        modifiedUserId: json['muid'] as String?,
        recordStatusTypeId: json['rstid'] as String,
        recordStatusTypeCode: json['rstcode'] as String,
        reasonCodeId: json['rcid'] as String,
        reasonCodeCode: json['rccode'] as String,
        reasonCodeDescription: json['rcdesc'] as String?,
        periodId: json['pid'] as String,
        periodBeginDate: json['pbd'] == null ? null : DateTime.parse(json['pbd'] as String),
        periodEndDate: json['ped'] == null ? null : DateTime.parse(json['ped'] as String),
        description: json['desc'] as String?,
        taxTypeId: json['ttid'] as String,
        taxTypeCode: json['ttcode'] as String,
        minValue: (json['min'] as num).toDouble(),
        maxValue: (json['max'] as num).toDouble(),
        isPercentage: json['isper'] as bool,
        taxTypeRecordTextsModel: texts,
      );
    } on Failure {
      rethrow;
    }
    catch (e) {
      throw SerializeJsonFailure(message: e.toString());
    }
  }
}
