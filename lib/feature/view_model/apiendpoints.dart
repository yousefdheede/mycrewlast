class ApiEndPoints {
  static final String baseUrl = 'http://127.0.0.1:8000/';
  static _ApiEndPoints authEndPoints = _ApiEndPoints();
}

class _ApiEndPoints {
  final String registerUrl = 'jobs/register_user';
  final String loginUrl = 'jobs/login_user';
  final String create_job = 'jobs/create_jobs';
  final String get_all_jobs = 'jobs/get_all_jobs';
  final String get_job_by_skills = 'jobs/get_jobs_by_skills';
  final String get_job_by_title = 'jobs/get_jobs_by_title';
  final String get_job_by_location = 'jobs/get_jobs_by_location';
  final String update_job = 'jobs/update_jobs';
}
