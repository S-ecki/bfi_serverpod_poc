/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'info.dart' as _i3;
import 'infos.dart' as _i4;
import 'protocol.dart' as _i5;
export 'info.dart';
export 'infos.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    ..._i2.Protocol.targetTableDefinitions
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i3.Info) {
      return _i3.Info.fromJson(data) as T;
    }
    if (t == _i4.Infos) {
      return _i4.Infos.fromJson(data) as T;
    }
    if (t == _i1.getType<_i3.Info?>()) {
      return (data != null ? _i3.Info.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Infos?>()) {
      return (data != null ? _i4.Infos.fromJson(data) : null) as T;
    }
    if (t == List<_i5.Info>) {
      return (data as List).map((e) => deserialize<_i5.Info>(e)).toList()
          as dynamic;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i3.Info) {
      return 'Info';
    }
    if (data is _i4.Infos) {
      return 'Infos';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Info') {
      return deserialize<_i3.Info>(data['data']);
    }
    if (data['className'] == 'Infos') {
      return deserialize<_i4.Infos>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'poc';
}
