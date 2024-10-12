import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'source_model.g.dart';

@HiveType(typeId: 1)
class SourceModel extends Equatable {
  @HiveField(8)
  final String? id;
  @HiveField(9)
  final String? name;

  const SourceModel({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
