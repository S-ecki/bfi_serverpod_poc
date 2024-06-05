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
    this.important,
  });

  factory Info({
    required String title,
    required String body,
    bool? important,
  }) = _InfoImpl;

  factory Info.fromJson(Map<String, dynamic> jsonSerialization) {
    return Info(
      title: jsonSerialization['title'] as String,
      body: jsonSerialization['body'] as String,
      important: jsonSerialization['important'] as bool?,
    );
  }

  String title;

  String body;

  bool? important;

  Info copyWith({
    String? title,
    String? body,
    bool? important,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      if (important != null) 'important': important,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'title': title,
      'body': body,
      if (important != null) 'important': important,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _InfoImpl extends Info {
  _InfoImpl({
    required String title,
    required String body,
    bool? important,
  }) : super._(
          title: title,
          body: body,
          important: important,
        );

  @override
  Info copyWith({
    String? title,
    String? body,
    Object? important = _Undefined,
  }) {
    return Info(
      title: title ?? this.title,
      body: body ?? this.body,
      important: important is bool? ? important : this.important,
    );
  }
}
