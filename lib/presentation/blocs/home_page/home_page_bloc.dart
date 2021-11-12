import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code_base/core/resources/data_state.dart';
import 'package:flutter_code_base/data/services/home_page_service.dart';
import 'package:flutter_code_base/presentation/blocs/home_page/home_page_event.dart';
import 'package:flutter_code_base/presentation/blocs/home_page/home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent,HomePageState>{
  HomePageBloc(this._homePageSevice) : super(const JobCategoryLoading());
  final HomePageService _homePageSevice;

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async*{
    if (event is LoadJobCategoryEvent) {
      yield JobCategoryLoading();
      yield await _mapJobCategoryApiFetchToState();
    }else if (event is LoadJobEvent) {
      yield await _mapJobApiFetchToState();
    }
  }

  // Transform functions
  Future<JobCategoryState> _mapJobCategoryApiFetchToState() async {
    final _result = await _homePageSevice.getCategories();
    if (_result is DataSuccess) {
      return JobCategorySuccess(_result.data);
    } else {
      return JobCategoryFailure(_result.error?.message);
    }
  }
  Future<JobState> _mapJobApiFetchToState() async {
    final _result = await _homePageSevice.getJobs();
    if (_result is DataSuccess) {
      return JobSuccess(_result.data);
    } else {
      return JobFailure(_result.error?.message);
    }
  }


}