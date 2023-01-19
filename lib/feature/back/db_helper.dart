import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_crew/feature/model/job_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import '../../utils/utils/utils.dart';
import '../model/company_model.dart';
import '../model/user_model.dart';
import '../view/app/home/home_placeholder_screen/home_placeholder_screen.dart';

class DbHelper {
  late Database database;
  static DbHelper dbHelper = DbHelper();
  final String tableName1 = "jobs";
  final String tableName2 = "client";
  final String tableName3 = "company";
  final String tableName4 = "skills";

  initDatabase() async {
    database = await createDatabaseConnection();
  }

  Future<Database> createDatabaseConnection() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String folderPath = directory.path;
    return openDatabase('$folderPath/tasks.db', version: 1,
        onCreate: (db, version) {
      db.execute('''CREATE TABLE $tableName1 (
            job_id INTEGER PRIMARY KEY AUTOINCREMENT, 
            job_title TEXT, 
            salary INTEGER,
            job_type TEXT
            job_Description TEXT,

            )''');
      db.execute('''CREATE TABLE $tableName4 (
            skills_id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE, 
            skills_tag TEXT UNIQUE, 
            )''');
      db.execute('''CREATE TABLE $tableName3 (
            company_id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE, 
            company_name TEXT UNIQUE, 
            company_email TEXT UNIQUE,
            company_phone INTEGER,
            company_field TEXT ,
            company_Description TEXT,
            company_password TEXT,
            company_location DOUBLE,
            )''');
      db.execute('''CREATE TABLE $tableName2 (
            client_id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE, 
            client_name TEXT, 
            client_email TEXT UNIQUE,
            client_phone INTEGER,
            client_gender TEXT,
            client_field TEXT,
            client_bio TEXT,
            client_password TEXT,
            client_location DOUBLE,
            )''');
    });
  }

  Future<void> insertNewJob(JobModel jobmodel) async {
    await database.insert('jobs', jobmodel.toMap());
  }

  Future<List<JobModel>> getAlljobs() async {
    List<Map<String, dynamic>> data = await database.query('jobs');
    return data.map((e) => JobModel.fromMap(e)).toList();
  }
/*
  Future<int> deletejob(JobModel jobmodel) async {
    int count = await database
        .delete('jobs', where: 'job_id=?', whereArgs: [jobmodel.job_id]);
    return count;
  }*/

  Future<void> insertNewclient(UserModel jobmodel) async {
    await database.insert('client', jobmodel.toMap());
    Utils.instance.showProgressDialog();
    Get.offAll(() => const HomePlaceholderScreen());
    Utils.instance.hideProgressDialog();
  }

  Future<List<JobModel>> getAllclient() async {
    List<Map<String, dynamic>> data = await database.query('client');
    return data.map((e) => JobModel.fromMap(e)).toList();
  }

  Future<int> deleteclient(UserModel jobmodel) async {
    int count = await database.delete('client',
        where: 'client_id=?', whereArgs: [jobmodel.client_id]);
    return count;
  }

  Future<int> insertNewcompany(CompanyModel jobmodel) async {
    int i = await database.insert('company', jobmodel.toMap());
    return i;
  }

  Future<List> getAllcompany() async {
    List<Map<String, dynamic>> data = await database.query('company');
    return data.map((e) => CompanyModel.fromMap(e)).toList();
  }

  Future<int> deletecompany(CompanyModel jobmodel) async {
    int count = await database.delete('company',
        where: 'company_id=?', whereArgs: [jobmodel.company_id]);
    return count;
  }
}
