part of 'base_page_reponse.dart';

@freezed
class ListTotalResponse with _$ListTotalResponse {
  const factory ListTotalResponse({
    @Default(.0) double total1,
    @Default('false') String total1Name,
    @Default(.0) double total2,
    @Default('false') String total2Name,
    @Default(.0) double total3,
    @Default('false') String total3Name,
    @Default(.0) double total4,
    @Default('false') String total4Name,
  }) = _ListTotalResponse;

  // To JSON
  const ListTotalResponse._();

  // From JSON
  factory ListTotalResponse.fromJson(Json json) =>
      _$ListTotalResponseFromJson(json);
}
