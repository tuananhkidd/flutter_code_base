import 'package:json_annotation/json_annotation.dart';

part 'setting_search.g.dart';

@JsonSerializable()
class SettingSearch {
  List<SalaryBean> salary;
  List<RewardBean> reward;

  SettingSearch({required this.salary, required this.reward});

  factory SettingSearch.fromJson(Map<String, dynamic> json) => _$SettingSearchFromJson(json);

  Map<String, dynamic> toJson() => _$SettingSearchToJson(this);

  @override
  String toString() {
    return 'SettingSearch{salary: $salary, reward: $reward}';
  }
}

@JsonSerializable()
class RewardBean {
  num id;
  String key_search;
  String? value;
  bool isSelect = false;

  RewardBean({required this.id, required this.key_search, this.value});

  factory RewardBean.fromJson(Map<String, dynamic> json) => _$RewardBeanFromJson(json);

  Map<String, dynamic> toJson() => _$RewardBeanToJson(this);

  @override
  String toString() {
    return 'RewardBean{id: $id, key_search: $key_search, value: $value, isSelect: $isSelect}';
  }
}

@JsonSerializable()
class SalaryBean {
  num id;
  String key_search;
  String? value;
  bool isSelect = false;

  SalaryBean({required this.id, required this.key_search, this.value});

  factory SalaryBean.fromJson(Map<String, dynamic> json) => _$SalaryBeanFromJson(json);

  Map<String, dynamic> toJson() => _$SalaryBeanToJson(this);

  @override
  String toString() {
    return 'SalaryBean{id: $id, key_search: $key_search, value: $value, isSelect: $isSelect}';
  }
}

