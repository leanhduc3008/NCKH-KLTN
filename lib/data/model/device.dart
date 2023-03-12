import 'package:freezed_annotation/freezed_annotation.dart';

part 'device.freezed.dart';
part 'device.g.dart';

@freezed
class Device with _$Device {
  @JsonSerializable(explicitToJson: true)
  const factory Device({
    @Default(1) int status,
    String? imageUrl,
    @Default('') String name,
    @Default('') String code,
    @Default('') String information,
  }) = _Device;
  // From JSON
  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

  // To JSON
  const Device._();
}
