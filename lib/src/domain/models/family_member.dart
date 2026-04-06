import 'model_enums.dart';

class FamilyMember {
  const FamilyMember({
    required this.id,
    required this.name,
    required this.relation,
    required this.avatarColorHex,
    required this.isSystemDefault,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String name;
  final MemberRelation relation;
  final String avatarColorHex;
  final bool isSystemDefault;
  final DateTime createdAt;
  final DateTime updatedAt;

  FamilyMember copyWith({
    String? id,
    String? name,
    MemberRelation? relation,
    String? avatarColorHex,
    bool? isSystemDefault,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return FamilyMember(
      id: id ?? this.id,
      name: name ?? this.name,
      relation: relation ?? this.relation,
      avatarColorHex: avatarColorHex ?? this.avatarColorHex,
      isSystemDefault: isSystemDefault ?? this.isSystemDefault,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

