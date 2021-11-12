import 'package:flutter_code_base/data/models/base_list_response.dart';
import 'package:flutter_code_base/data/models/job.dart';
import 'package:flutter_code_base/data/models/job_category.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'home_page_api.g.dart';

@RestApi()
abstract class HomePageApi{
  factory HomePageApi(Dio dio) = _HomePageApi;

  @GET("/job-genres")
  Future<HttpResponse<BaseListResponse<JobCategory>>> getJobCategory();

  @GET("/jobs")
Future<HttpResponse<BaseListResponse<Job>>> getJobs(@Query("work_style",encoded: true) int workStyle);
}

