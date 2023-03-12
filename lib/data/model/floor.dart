import 'package:freezed_annotation/freezed_annotation.dart';

import 'device.dart';
import 'room.dart';

part 'floor.freezed.dart';
part 'floor.g.dart';

@freezed
class Floor with _$Floor {
  @JsonSerializable(explicitToJson: true)
  const factory Floor({
    String? id,
    @Default(0) int position,
    @Default('') String name,
    @Default([]) List<Room> rooms,
  }) = _Floor;
  // From JSON
  factory Floor.fromJson(Map<String, dynamic> json) => _$FloorFromJson(json);

  // To JSON
  const Floor._();

  // Fake data
  static const List<Floor> datas = [
    Floor(position: 1, name: 'Floor 1', rooms: [
      Room(name: 'Room 1.1', devices: [
        Device(
          name: 'Deive of room 1.1',
          information: 'Thong tin cua thiet bi 1',
        ),
      ]),
      Room(name: 'Room 1.2', devices: [
        Device(
          name: 'Deive 1 of room 1.2',
          information: 'Thong tin cua thiet bi 2',
        ),
        Device(
          name: 'Deive 2 of room 1.2',
          information: 'Thong tin cua thiet bi 3',
        ),
      ]),
    ]),
    Floor(position: 2, name: 'Floor 2', rooms: [
      Room(name: 'Room 2.1', devices: [
        Device(
          name: 'Deive 1 of room 2.1',
          information: 'Thong tin cua thiet bi 4',
        ),
        Device(
          name: 'Deive 2 of room 2.2',
          information: 'Thong tin cua thiet bi 5',
        ),
      ]),
      Room(name: 'Room 2.2', devices: [
        Device(
          name: 'Deive of room 2.2',
          information: 'Thong tin cua thiet bi 6',
        ),
      ]),
      Room(name: 'Room 2.3', devices: [
        Device(
          name: 'Deive of room 2.3',
          information: 'Thong tin cua thiet bi 7',
        ),
      ]),
    ]),
    Floor(position: 3, name: 'Floor 3', rooms: [
      Room(name: 'Room 3.1', devices: [
        Device(
          name: 'Deive 1 of room 3.1',
          information: 'Thong tin cua thiet bi 8',
        ),
      ]),
      Room(name: 'Room 3.2', devices: [
        Device(
          name: 'Deive of room 2.2',
          information: 'Thong tin cua thiet bi 9',
        ),
      ]),
      Room(name: 'Room 3.3', devices: [
        Device(
          name: 'Deive of room 2.3',
          information: 'Thong tin cua thiet bi 10',
        ),
      ]),
    ]),
  ];
}
