// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Job _$JobFromJson(Map<String, dynamic> json) {
  return Job(
    id: json['id'] as num,
    title: json['title'] as String?,
    thumbnail: json['thumbnail'] as String?,
    date: json['date'] as String?,
    time_start: json['time_start'] as String?,
    time_end: json['time_end'] as String?,
    flag_deadline: json['flag_deadline'] as num?,
    user_name: json['user_name'] as String?,
    salary_type: json['salary_type'] as num?,
    traffic_charges: json['traffic_charges'] as num?,
    salary: json['salary'] as num?,
    employment_status: json['employment_status'] as num?,
  );
}

Map<String, dynamic> _$JobToJson(Job instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'thumbnail': instance.thumbnail,
      'date': instance.date,
      'time_start': instance.time_start,
      'time_end': instance.time_end,
      'flag_deadline': instance.flag_deadline,
      'user_name': instance.user_name,
      'salary_type': instance.salary_type,
      'traffic_charges': instance.traffic_charges,
      'salary': instance.salary,
      'employment_status': instance.employment_status,
    };
