import '../response_entity.dart';

abstract class ResponseEntityWithCodeAndDesc extends ResponseEntity {
  final String code;
  final String? description;

  ResponseEntityWithCodeAndDesc({
    required String id,
    required DateTime createdDate,
    required DateTime? modifiedDate,
    required String createdUserId,
    required String? modifiedUserId,
    required this.code,
    required this.description,
  }) : super(
          id: id,
          createdDate: createdDate,
          modifiedDate: modifiedDate,
          createdUserId: createdUserId,
          modifiedUserId: modifiedUserId,
        );
}
