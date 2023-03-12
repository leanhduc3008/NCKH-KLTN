import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

class ConvertStringToInt implements JsonConverter<int, String> {
  const ConvertStringToInt();

  @override
  int fromJson(String json) => int.tryParse(json) ?? 0;

  @override
  String toJson(int object) => object.toString();
}

class ConvertStringToDouble implements JsonConverter<double, String> {
  const ConvertStringToDouble();

  @override
  double fromJson(String json) => double.tryParse(json) ?? 0;

  @override
  String toJson(double object) => object.toString();
}

class ConvertStringToDateTime implements JsonConverter<DateTime, String> {
  const ConvertStringToDateTime();

  static DateFormat format = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS");

  @override
  DateTime fromJson(String json) {
    return format.parse(json);
  }

  @override
  String toJson(DateTime object) {
    return format.format(object);
  }
}

class ConvertStringToDate implements JsonConverter<DateTime, String> {
  const ConvertStringToDate();

  static DateFormat format = DateFormat('yyyy-MM-dd');

  @override
  DateTime fromJson(String json) {
    return format.parse(json);
  }

  @override
  String toJson(DateTime object) {
    return format.format(object);
  }
}
