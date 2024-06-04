/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'info.dart' as _i2;
import 'infos.dart' as _i3;
import 'protocol.dart' as _i4;
export 'info.dart';
export 'infos.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Info) {
      return _i2.Info.fromJson(data) as T;
    }
    if (t == _i3.Infos) {
      return _i3.Infos.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Info?>()) {
      return (data != null ? _i2.Info.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Infos?>()) {
      return (data != null ? _i3.Infos.fromJson(data) : null) as T;
    }
    if (t == List<_i4.Info>) {
      return (data as List).map((e) => deserialize<_i4.Info>(e)).toList()
          as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.Info) {
      return 'Info';
    }
    if (data is _i3.Infos) {
      return 'Infos';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Info') {
      return deserialize<_i2.Info>(data['data']);
    }
    if (data['className'] == 'Infos') {
      return deserialize<_i3.Infos>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
