// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingSearch _$SettingSearchFromJson(Map<String, dynamic> json) {
  return SettingSearch(
    salary: (json['salary'] as List<dynamic>)
        .map((e) => SalaryBean.fromJson(e as Map<String, dynamic>))
        .toList(),
    reward: (json['reward'] as List<dynamic>)
        .map((e) => RewardBean.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SettingSearchToJson(SettingSearch instance) =>
    <String, dynamic>{
      'salary': instance.salary,
      'reward': instance.reward,
    };

RewardBean _$RewardBeanFromJson(Map<String, dynamic> json) {
  return RewardBean(
    id: json['id'] as num,
    key_search: json['key_search'] as String,
    value: json['value'] as String?,
  );
}

Map<String, dynamic> _$RewardBeanToJson(RewardBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key_search': instance.key_search,
      'value': instance.value,
    };

SalaryBean _$SalaryBeanFromJson(Map<String, dynamic> json) {
  return SalaryBean(
    id: json['id'] as num,
    key_search: json['key_search'] as String,
    value: json['value'] as String?,
  );
}

Map<String, dynamic> _$SalaryBeanToJson(SalaryBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key_search': instance.key_search,
      'value': instance.value,
    };
