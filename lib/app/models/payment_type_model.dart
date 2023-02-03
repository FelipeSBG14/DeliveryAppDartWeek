import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class PaymentTypeModel {
  final int id;
  final String name;
  final String acronyn;
  final bool enable;
  PaymentTypeModel({
    required this.id,
    required this.name,
    required this.acronyn,
    required this.enable,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'acronyn': acronyn,
      'enable': enable,
    };
  }

  factory PaymentTypeModel.fromMap(Map<String, dynamic> map) {
    return PaymentTypeModel(
      id: map['id'] as int,
      name: map['name'] as String,
      acronyn: map['acronyn'] as String,
      enable: map['enable'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentTypeModel.fromJson(String source) =>
      PaymentTypeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
