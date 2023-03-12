import 'package:freezed_annotation/freezed_annotation.dart';

import 'device.dart';

part 'ticket.freezed.dart';
part 'ticket.g.dart';

@freezed
class Ticket with _$Ticket {
  @JsonSerializable(explicitToJson: true)
  const factory Ticket({
    String? floorId,
    required String email,
    required Device device,
    @Default('') String title,
    @Default('') String content,
  }) = _Ticket;
  // From JSON
  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);

  // To JSON
  const Ticket._();
}
