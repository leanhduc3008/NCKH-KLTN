import 'package:freezed_annotation/freezed_annotation.dart';

import 'base_typedef.dart';

part 'list_total_response.dart';
part 'page_response.dart';
part 'base_page_reponse.freezed.dart';
part 'base_page_reponse.g.dart';

class BasePageResponse<T> {
  const BasePageResponse({
    this.page = const PageResponse(),
    this.totalValue = const ListTotalResponse(),
  });

  factory BasePageResponse.fromJson(Json json, {FromJson<T>? fromJson}) =>
      BasePageResponse<T>(
        page: json['page'] == null
            ? const PageResponse()
            : PageResponse.fromJson(
                json['page'] as Json,
                fromJson: fromJson,
              ),
        totalValue: json['totalValue'] == null
            ? const ListTotalResponse()
            : ListTotalResponse.fromJson(json['totalValue'] as Json),
      );

  final PageResponse<T> page;
  final ListTotalResponse totalValue;

  Json toJsonBase([ToJson<T>? toJson]) => <String, dynamic>{
        'page': page.toJson(toJson),
        'totalValue': totalValue.toJson(),
      };

  BasePageResponse<T> copyWith({
    PageResponse<T>? page,
    ListTotalResponse? totalValue,
  }) =>
      BasePageResponse(
        page: page ?? this.page,
        totalValue: totalValue ?? this.totalValue,
      );
}
