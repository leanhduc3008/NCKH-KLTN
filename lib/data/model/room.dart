import 'package:freezed_annotation/freezed_annotation.dart';

import 'device.dart';

part 'room.freezed.dart';
part 'room.g.dart';

@freezed
class Room with _$Room {
  @JsonSerializable(explicitToJson: true)
  const factory Room({
    @Default('') String name,
    @Default([]) List<Device> devices,
  }) = _Room;
  // From JSON
  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  // To JSON
  const Room._();
}
