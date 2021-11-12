// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobCategory _$JobCategoryFromJson(Map<String, dynamic> json) {
  return JobCategory(
    id: json['id'] as num?,
    name: json['name'] as String?,
    image_url: json['image_url'] as String?,
  );
}

Map<String, dynamic> _$JobCategoryToJson(JobCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.image_url,
    };
