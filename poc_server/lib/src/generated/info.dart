/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Info
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  Info._({
    required this.title,
    required this.body,
  });

  factory Info({
    required String title,
    required String body,
  }) = _InfoImpl;

  factory Info.fromJson(Map<String, dynamic> jsonSerialization) {
    return Info(
      title: jsonSerialization['title'] as String,
      body: jsonSerialization['body'] as String,
    );
  }

  String title;

  String body;

  Info copyWith({
    String? title,
    String? body,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'title': title,
      'body': body,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _InfoImpl extends Info {
  _InfoImpl({
    required String title,
    required String body,
  }) : super._(
          title: title,
          body: body,
        );

  @override
  Info copyWith({
    String? title,
    String? body,
  }) {
    return Info(
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
