import 'package:freezed_annotation/freezed_annotation.dart';

part 'procedure.freezed.dart';

part 'procedure.g.dart';

@freezed
class Procedure with _$Procedure {
  const factory Procedure({
    required String step,
    required String description,
  }) = _Procedure;

  factory Procedure.fromJson(Map<String, Object?> json) =>
      _$ProcedureFromJson(json);
}
