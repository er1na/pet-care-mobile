import 'dart:convert';
import 'package:drift/drift.dart';

class StringListConverter extends TypeConverter<List<String>, String>{
  const StringListConverter();
  @override
  List<String> fromSql(String fromDb){
    if(fromDb.isEmpty) return const [];
    final raw = jsonDecode(fromDb);
    if(raw is List){
      return raw.map((e) => e.toString()).toList();
    }
    return const [];
  }

  @override
  String toSql(List<String> value) => jsonEncode(value);
}