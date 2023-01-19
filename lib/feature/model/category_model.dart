import 'dart:convert';

class CategoryModel {
  CategoryModel({this.name, this.imageUrl, this.jobs});

  String? name;
  String? jobs;
  String? imageUrl;

  static const String nameKey = 'name';
  static const String jobsKey = 'jobs';
  static const String imageUrlKey = 'image_url';

  Map<String, dynamic> toJson({bool local = false, bool isUpdate = false}) {
    return {
      jobsKey: jobs,
      nameKey: name,
      imageUrlKey: imageUrl,
    };
  }

  CategoryModel.fromJson(Map<String, dynamic> json, {bool local = false}) {
    name = json[nameKey];
    jobs = json[jobsKey];
    imageUrl = json[imageUrlKey];
  }

  CategoryModel copyWith({
    String? name,
    String? jobs,
    String? imageUrl,
  }) {
    return CategoryModel(
      name: name ?? this.name,
      jobs: jobs ?? this.jobs,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (name != null) {
      result.addAll({'name': name});
    }
    if (jobs != null) {
      result.addAll({'jobs': jobs});
    }
    if (imageUrl != null) {
      result.addAll({'imageUrl': imageUrl});
    }

    return result;
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      name: map['name'],
      jobs: map['jobs'],
      imageUrl: map['imageUrl'],
    );
  }

  @override
  String toString() {
    return 'cat( name: $name, jobs: $jobs, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryModel &&
        other.name == name &&
        other.jobs == jobs &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return name.hashCode ^ jobs.hashCode ^ imageUrl.hashCode;
  }
}

class catdata {
  String name;
  String jobs;
  String imageUrl;
  catdata(
    this.name,
    this.jobs,
    this.imageUrl,
  );
  static List<catdata> catlist() {
    return [
      catdata('FrontEnd', '2', 'catimage/frontend.jpeg'),
      catdata('Backend', '5', 'catimage/backend.jpg'),
      catdata('c++', '4', 'catimage/c++.png'),
      catdata('Networks', '4', 'catimage/networks.jpg'),
      catdata('Teacher', '9', 'catimage/teacher.jpg'),
      catdata('UI/UX', '8', 'assets\catimage\\uiux.png'),
      catdata('Doctor', '2', 'assets\catimage\doctor.wepp'),
    ];
  }
}
