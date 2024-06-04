/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class Infos
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  Infos._({required this.infoList});

  factory Infos({required List<_i2.Info> infoList}) = _InfosImpl;

  factory Infos.fromJson(Map<String, dynamic> jsonSerialization) {
    return Infos(
        infoList: (jsonSerialization['infoList'] as List)
            .map((e) => _i2.Info.fromJson((e as Map<String, dynamic>)))
            .toList());
  }

  List<_i2.Info> infoList;

  Infos copyWith({List<_i2.Info>? infoList});
  @override
  Map<String, dynamic> toJson() {
    return {'infoList': infoList.toJson(valueToJson: (v) => v.toJson())};
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'infoList': infoList.toJson(valueToJson: (v) => v.toJsonForProtocol())
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _InfosImpl extends Infos {
  _InfosImpl({required List<_i2.Info> infoList}) : super._(infoList: infoList);

  @override
  Infos copyWith({List<_i2.Info>? infoList}) {
    return Infos(infoList: infoList ?? this.infoList.clone());
  }
}
