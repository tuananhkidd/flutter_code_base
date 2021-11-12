import 'package:json_annotation/json_annotation.dart';

part 'job_category.g.dart';

@JsonSerializable()
class JobCategory {
  num? id;
  String? name;
  String? image_url;
  bool isSelect = false;

  JobCategory({this.id, this.name, this.image_url});

  factory JobCategory.fromJson(Map<String, dynamic> json) => _$JobCategoryFromJson(json);
  //
  Map<String, dynamic> toJson() => _$JobCategoryToJson(this);

  @override
  String toString() {
    return 'JobCategory{id: $id, name: $name, image_url: $image_url}';
  }
}

