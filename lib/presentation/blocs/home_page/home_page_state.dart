import 'package:equatable/equatable.dart';
import 'package:flutter_code_base/data/models/job.dart';
import 'package:flutter_code_base/data/models/job_category.dart';

abstract class HomePageState extends Equatable{
  const HomePageState();
  @override
  List<Object?> get props => [];
}

abstract class JobCategoryState extends HomePageState {
  final List<JobCategory>? jobCategory;


  const JobCategoryState(this.jobCategory);

  @override
  List<Object?> get props => [jobCategory];
}

class JobCategoryLoading extends JobCategoryState{
  const JobCategoryLoading() : super(null);
}

class JobCategorySuccess extends JobCategoryState{
  const JobCategorySuccess(List<JobCategory>? categories) : super(categories);
}


class JobCategoryFailure extends JobCategoryState{
  final String? message;
  const JobCategoryFailure(this.message) : super(null);
}

abstract class JobState extends HomePageState {
  final List<Job>? job;

  const JobState(this.job);

  @override
  List<Object?> get props => [job];
}

class JobLoading extends JobState{
  const JobLoading() : super(null);
}

class JobSuccess extends JobState{
  const JobSuccess(List<Job>? categories) : super(categories);
}


class JobFailure extends JobState{
  final String? message;
  const JobFailure(this.message) : super(null);
}