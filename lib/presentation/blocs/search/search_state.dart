import 'package:equatable/equatable.dart';
import 'package:flutter_code_base/data/models/address.dart';
import 'package:flutter_code_base/data/models/job_category.dart';
import 'package:flutter_code_base/data/models/setting_search.dart';

abstract class SearchState  {
  // @override
  // List<Object?> get props {
  //   return [];
  // }
}

class InitialSearchState extends SearchState{

}

class AddressState extends SearchState {
  List<Address> address;

  AddressState(this.address);

  @override
  List<Object?> get props => [address];
}

class SettingSearchState extends SearchState {
  List<SalaryBean> salaries;
  List<RewardBean> rewards;
  List<Address> address;
  List<JobCategory> jobCategory;


  SettingSearchState(this.salaries,this.rewards, this.address, this.jobCategory);

  // @override
  // List<Object?> get props => [salaries,rewards,address,jobCategory];
}

class SettingSearchLoadingState extends SettingSearchState {
  SettingSearchLoadingState() : super([],[],[],[]);
}

class SettingSearchSuccessState extends SettingSearchState {
  SettingSearchSuccessState(List<SalaryBean> salaries,List<RewardBean> rewards ,List<Address> address,List<JobCategory> jobCategory)
      : super(salaries,rewards,address,jobCategory);
}

class SettingSearchFailureState extends SettingSearchState {
  SettingSearchFailureState(this.msg) : super([],[],[],[]);
  String? msg;
}

class JobCategoryState extends SearchState {
  List<JobCategory> jobCategory;


  JobCategoryState(this.jobCategory);

  // @override
  // List<Object?> get props => [jobCategory];
}

class MapToApiState extends SearchState{

}