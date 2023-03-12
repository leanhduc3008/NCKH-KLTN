part of 'base_page_reponse.dart';

class PageResponse<T> {
  const PageResponse({
    this.content = const [],
    this.sort = const Sort(),
    this.pageable = const Pageable(),
    this.first = true,
    this.last = true,
    this.number = 0,
    this.numberOfElements = 0,
    this.size = 0,
    this.totalElements = 0,
    this.totalPages = 0,
  });

  factory PageResponse.fromJson(
    Json json, {
    FromJson<T>? fromJson,
  }) =>
      PageResponse<T>(
        content: (json['content'] as List<dynamic>?)
                ?.map((e) => fromJson != null ? fromJson(e as Json) : e as T)
                .toList() ??
            const [],
        sort: json['sort'] == null
            ? const Sort()
            : Sort.fromJson(json['sort'] as Json),
        pageable: json['pageable'] == null
            ? const Pageable()
            : Pageable.fromJson(json['pageable'] as Json),
        first: json['first'] as bool? ?? true,
        last: json['last'] as bool? ?? true,
        number: json['number'] as int? ?? 0,
        numberOfElements: json['numberOfElements'] as int? ?? 0,
        size: json['size'] as int? ?? 0,
        totalElements: json['totalElements'] as int? ?? 0,
        totalPages: json['totalPages'] as int? ?? 0,
      );

  final List<T> content;
  final Pageable pageable;
  final Sort sort;
  final bool first;
  final bool last;
  final int number;
  final int numberOfElements;
  final int size;
  final int totalElements;
  final int totalPages;

  Json toJson([ToJson<T>? toJson]) => <String, dynamic>{
        'content': content.map((e) => toJson != null ? toJson(e) : e),
        'pageable': pageable.toJson(),
        'sort': sort.toJson(),
        'first': first,
        'last': last,
        'number': number,
        'numberOfElements': numberOfElements,
        'size': size,
        'totalElements': totalElements,
        'totalPages': totalPages,
      };

  PageResponse<T> copyWith({
    List<T>? content,
    Pageable? pageable,
    Sort? sort,
    bool? first,
    bool? last,
    int? number,
    int? numberOfElements,
    int? size,
    int? totalElements,
    int? totalPages,
  }) =>
      PageResponse<T>(
        content: content ?? this.content,
        pageable: pageable ?? this.pageable,
        sort: sort ?? this.sort,
        first: first ?? this.first,
        last: last ?? this.last,
        number: number ?? this.number,
        numberOfElements: numberOfElements ?? this.numberOfElements,
        size: size ?? this.size,
        totalElements: totalElements ?? this.totalElements,
        totalPages: totalPages ?? this.totalPages,
      );
}

@freezed
class Pageable with _$Pageable {
  const factory Pageable({
    @Default(0) int offset,
    @Default(0) int pageNumber,
    @Default(0) int pageSize,
    @Default(false) bool paged,
    @Default(Sort()) Sort sort,
    @Default(false) bool unpaged,
  }) = _Pageable;

  // To JSON
  const Pageable._();

  // From JSON
  factory Pageable.fromJson(Json json) => _$PageableFromJson(json);
}

@freezed
class Sort with _$Sort {
  const factory Sort({
    @Default(false) bool sorted,
    @Default(false) bool unsorted,
  }) = _Sort;

  // To JSON
  const Sort._();

  // From JSON
  factory Sort.fromJson(Json json) => _$SortFromJson(json);

  static String asc = 'asc';
  static String desc = 'desc';
  static String? toSort(int value) => value == 0
      ? null
      : value > 0
          ? asc
          : desc;
}
