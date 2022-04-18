import '../../../../core/core_export.dart';
import '../../tax_type_export.dart';

class TaxTypeRecordTextModel extends TaxTypeRecordText {
  TaxTypeRecordTextModel({
    required String id,
    required DateTime createdDate,
    required DateTime? modifiedDate,
    required String createdUserId,
    required String? modifiedUserId,
    required String periodId,
    required DateTime? periodBeginDate,
    required DateTime? periodEndDate,
    required String languageId,
    required String languageCode,
    required String languageGlobalText,
    required String languageCultureText,
    required String reasonCodeId,
    required String reasonCodeCode,
    required String? reasonCodeDescription,
    required String? description,
    required String? shortText,
    required String? text,
    required String? longText,
    required String taxTypeRecordId,
  }) : super(
    id: id,
    createdDate: createdDate,
    modifiedDate: modifiedDate,
    createdUserId: createdUserId,
    modifiedUserId: modifiedUserId,
    periodId: periodId,
    periodBeginDate: periodBeginDate,
    periodEndDate: periodEndDate,
    languageId: languageId,
    languageCode: languageCode,
    languageGlobalText: languageGlobalText,
    languageCultureText: languageCultureText,
    reasonCodeId: reasonCodeId,
    reasonCodeCode: reasonCodeCode,
    reasonCodeDescription: reasonCodeDescription,
    description: description,
    shortText: shortText,
    text: text,
    longText: longText,
    taxTypeRecordId: taxTypeRecordId,
  );

  factory TaxTypeRecordTextModel.fromJson({required Map<String, dynamic> json}){
    try {
      return TaxTypeRecordTextModel(
        id: json['id'] as String,
        createdDate: DateTime.parse(json['cd'] as String),
        modifiedDate: json['md'] == null ? null : DateTime.parse(json['md'] as String),
        createdUserId: json['cuid'] as String,
        modifiedUserId: json['muid'] as String?,
        periodId: json['pid'] as String,
        periodBeginDate: json['pbd'] == null ? null : DateTime.parse(json['pbd'] as String),
        periodEndDate: json['ped'] == null ? null : DateTime.parse(json['ped'] as String),
        languageId: json['lid'] as String,
        languageCode: json['lcode'] as String,
        languageGlobalText: json['lgtext'] as String,
        languageCultureText: json['lctext'] as String,
        reasonCodeId: json['rcid'] as String,
        reasonCodeCode: json['rccode'] as String,
        reasonCodeDescription: json['rcdesc'] as String?,
        description: json['desc'] as String?,
        shortText: json['stext'] as String?,
        text: json['text'] as String?,
        longText: json['ltext'] as String?,
        taxTypeRecordId: json['ttrid'] as String,
      );
    } catch (e) {
      throw SerializeJsonFailure(message: 'Failure to convert to json');
    }
  }
}
