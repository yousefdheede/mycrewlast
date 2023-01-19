import 'package:my_crew/feature/model/company_model.dart';

// ignore: camel_case_types
enum job_type {
  partTime,
  fullTime,
}

class JobModel {
  JobModel({
    // ignore: non_constant_identifier_names

    // ignore: non_constant_identifier_names
    //this.job_id,
    // ignore: non_constant_identifier_names
    this.job_title,
    this.job_Description,
    this.company,
    this.salary,
    this.salaryPeriod,
    this.salaryRange,
    // ignore: non_constant_identifier_names
    this.job_type,
    this.isSaved,
  });

  //int? job_id;
  String? job_title;
  String? salary;
  String? job_Description;
  String? salaryRange;
  String? salaryPeriod;
  CompanyModel? company;
  String? job_type;
  bool? isSaved;

  static const String idKey = 'job_id';
  static const String titleKey = 'job_title';
  static const String salaryKey = 'salary';
  static const String job_typeKey = 'job_type';
  static const String job_DescriptionKey = 'job_Description';
  static const String salaryRangeKey = 'salary_range';
  static const String salaryPeriodKey = 'salary_period';
  static const String companyKey = 'company';

  Map<String, dynamic> toMap() {
    return {
      'job_title': job_title,
      'salary': salary,
      'job_type': job_type,
      'job_Description': job_Description
    };
  }

  Map<String, dynamic> toJson({bool local = false, bool isUpdate = false}) {
    return {
      // idKey: job_id,
      titleKey: job_title,
    };
  }

  JobModel.fromJson(Map<String, dynamic> json, {bool local = false}) {
    //job_id = json[idKey];
    job_title = json[titleKey];
  }

  factory JobModel.fromMap(Map<String, dynamic> map) {
    return JobModel(
        //job_id: map['job_id']?.toInt(),
        job_title: map['job_title'],
        salary: map['salary'],
        job_type: map['job_type'],
        job_Description: map['job_Description']);
  }
}

class jobdata {
  String job_title;
  String salary;
  String job_Description;
  String company;
  String job_type;
  bool isSaved;
  String jobdate;

  jobdata(
    // ignore: non_constant_identifier_names

    // ignore: non_constant_identifier_names
    //this.job_id,
    // ignore: non_constant_identifier_names
    this.job_title,
    this.job_Description,
    this.company,
    this.salary,
    // ignore: non_constant_identifier_names
    this.job_type,
    this.isSaved,
    this.jobdate,
  );
  static List<jobdata> joblist() {
    return [
      jobdata('frontend developer', 'good developer to handle multiple tasks',
          'Software World', '1200\$ Monthly', 'full-time', false, '19/1/2023'),
      jobdata('Mechanical Eng', 'good in english and handcrafting', 'Brabus',
          '500\$ Monthly', 'part-time', false, '19/1/2023'),
      jobdata('Accountant', 'A frontend developer ', 'United Company',
          '1500\$ Monthly', 'full-time', false, '5/1/2023'),
      jobdata('Civil Eng', 'A frontend developer ', 'Brothers',
          '2000\$ Monthly', 'full-time', false, '7/1/2023'),
      jobdata('Music Teacher', 'A frontend developer', 'Najah', '500\$ Monthly',
          'part-time', false, '15/1/2023'),
      jobdata('frontend developer', 'A frontend developer ', 'on the trip',
          '500\$ Monthly', 'part-time', false, '19/1/2023'),
      jobdata(
          'Resident Doctor',
          'Experience doctor with time to sleep in the hospital ',
          'Softcare House',
          '5000\$ Monthly',
          'full-time',
          false,
          '19/1/2023'),
    ];
  }
}
