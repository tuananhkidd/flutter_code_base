import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code_base/core/resources/data_state.dart';
import 'package:flutter_code_base/data/models/address.dart';
import 'package:flutter_code_base/data/models/job_category.dart';
import 'package:flutter_code_base/data/models/setting_search.dart';
import 'package:flutter_code_base/data/services/search_service.dart';
import 'package:flutter_code_base/presentation/blocs/search/search_event.dart';
import 'package:flutter_code_base/presentation/blocs/search/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this.searchService) : super(InitialSearchState());

  List<Address> address = [];
  List<SalaryBean> salaries = [];
  List<RewardBean> rewards = [];
  List<JobCategory> jobCategories = [];

  final SearchService searchService;

  // final BuildContext context;

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is LoadJobCategoryEvent) {
      // yield JobCategoryState(_result.data ?? []);
    } else if (event is LoadSettingSearchEvent) {
      yield SettingSearchLoadingState();
      yield await _mapSettingSearchApiFetchToState();
    } else if(event is ChangeStatusEvent){
      changeStatusTag(event.data);
      print("state ChangeStatusEvent ${event.data}");
      // yield InitialSearchState();
      yield SettingSearchSuccessState(salaries,rewards,address,jobCategories);
    }
  }

  Future<SettingSearchState> _mapSettingSearchApiFetchToState() async {
    final categories = await searchService.getCategories();
    final address = await searchService.getAddresses();
    final _result = await searchService.getSettingSearch();

    this.address = address;
    this.salaries = _result.data?.data?.salary ?? [];
    this.rewards = _result.data?.data?.reward ?? [];
    this.jobCategories = categories.data ?? [];
    return SettingSearchSuccessState(salaries,rewards,this.address,jobCategories);
  }

  void changeStatusTag<T>(T selectItem){
      if(selectItem is SalaryBean){
        salaries.forEach((element) {
          element.isSelect = selectItem.id == element.id;
        });
      }else if(selectItem is RewardBean){
        rewards.forEach((element) {
          if(selectItem.id == element.id){
            element.isSelect = !element.isSelect;
          }
        });

      }else if(selectItem is JobCategory){
        jobCategories.forEach((element) {
          if(selectItem.id == element.id){
            element.isSelect = !element.isSelect;
          }
        });
      }
  }

}
