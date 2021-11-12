import 'package:equatable/equatable.dart';
import 'package:flutter_code_base/data/models/job.dart';
import 'package:flutter_code_base/data/models/job_category.dart';
import 'package:flutter_code_base/data/models/setting_search.dart';

abstract class SearchEvent extends Equatable{
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class LoadAddressEvent extends SearchEvent{

}

class LoadJobCategoryEvent extends SearchEvent {

}
class LoadSettingSearchEvent extends SearchEvent{

}

class ChangeStatusEvent<T> extends SearchEvent{

  T data;

  ChangeStatusEvent(this.data);

  @override
  List<Object> get props {
    if(data is SalaryBean){
      return [data as  SalaryBean];
    }else if(data is RewardBean){
      return [data as RewardBean];
    }else if(data is JobCategory){
      return [data as JobCategory];
    }
    return [];
  }
}