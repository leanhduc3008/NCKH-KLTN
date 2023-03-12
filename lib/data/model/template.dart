import 'package:freezed_annotation/freezed_annotation.dart';

part 'template.freezed.dart';
part 'template.g.dart';

@freezed
class Template with _$Template {
  @JsonSerializable(explicitToJson: true)
  const factory Template({
    @Default(1) int type,
    @Default('') String content,
  }) = _Template;
  // From JSON
  factory Template.fromJson(Map<String, dynamic> json) =>
      _$TemplateFromJson(json);

  // To JSON
  const Template._();
}
