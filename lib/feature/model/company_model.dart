class CompanyModel {
  CompanyModel({this.name, this.imageUrl, this.jobs});

  String? company_id;
  String? name;
  String? jobs;
  String? imageUrl;
  String? address;

  static const String idKey = 'id';
  static const String nameKey = 'name';
  static const String jobsKey = 'jobs';
  static const String imageUrlKey = 'image_url';
  static const String addressKey = 'adress';

  Map<String, dynamic> toJson({bool local = false, bool isUpdate = false}) {
    return {
      idKey: company_id,
      jobsKey: jobs,
      nameKey: name,
      imageUrlKey: imageUrl,
      addressKey: address,
    };
  }

  CompanyModel.fromJson(Map<String, dynamic> json, {bool local = false}) {
    company_id = json[idKey];
    name = json[nameKey];
    jobs = json[jobsKey];
    imageUrl = json[imageUrlKey];
    address = json[addressKey];
  }

  static fromMap(Map<String, dynamic> e) {}

  Map<String, dynamic> toMap() {
    return {
      'company_id': company_id,
    };
  }
}

class comdata {
  String name;
  String jobs;
  String imageUrl;
  String address;
  comdata(this.name, this.jobs, this.imageUrl, this.address);
  static List<comdata> comlist() {
    return [
      comdata('Software World', 'Web Devlopment',
          'assets/catimage/frontend.jpeg', 'Ramallah'),
      comdata('Brabus', 'Mechanical Eng', 'assets/catimage/frontend.jpeg',
          'Ramallah'),
      comdata('Software World', 'Web Devlopment',
          'assets/catimage/frontend.jpeg', 'Ramallah'),
      comdata('Software World', 'Web Devlopment',
          'assets/catimage/frontend.jpeg', 'Ramallah'),
      comdata('Software World', 'Web Devlopment',
          'assets/catimage/frontend.jpeg', 'Ramallah'),
      comdata('Software World', 'Web Devlopment',
          'assets/catimage/frontend.jpeg', 'Ramallah'),
      comdata('Software World', 'Web Devlopment',
          'assets/catimage/frontend.jpeg', 'Ramallah'),
    ];
  }
}
