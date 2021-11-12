import 'package:json_annotation/json_annotation.dart';

part 'job.g.dart';

@JsonSerializable()
class Job {
  num id;
  String? title;
  String? thumbnail;
  String? date;
  String? time_start;
  String? time_end;
  num? flag_deadline;
  String? user_name;
  num? salary_type;
  num? traffic_charges;
  num? salary;
  num? employment_status;

  Job({required this.id, this.title, this.thumbnail, this.date, this.time_start, this.time_end, this.flag_deadline, this.user_name, this.salary_type, this.traffic_charges, this.salary, this.employment_status});

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);

  Map<String, dynamic> toJson() => _$JobToJson(this);
}

