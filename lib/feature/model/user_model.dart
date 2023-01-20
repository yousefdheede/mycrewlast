class UserModel {
  UserModel(
      {
      //this.client_id,
      this.client_name,
      this.client_email,
      this.client_phone,
      this.imageUrl,
      this.client_bio,
      this.client_gender,
      this.client_field,
      this.client_password,
      this.client_location
      //
      });

  String? client_id;
  String? client_name;
  String? imageUrl;
  String? client_email;
  String? client_phone;
  String? client_bio;
  String? client_gender;
  String? client_field;
  String? client_password;
  double? client_location;

  static const String client_idKey = 'client_id';
  static const String client_nameKey = 'client_name';
  static const String client_emailKey = 'client_email';
  static const String imageUrlKey = 'image_url';
  static const String client_phoneKey = 'client_phone';
  static const String client_biokey = 'account_client_biotype';
  static const String client_genderkey = 'client_gender';
  static const String client_fieldkey = 'latclient_fielditude';
  static const String client_passwordkey = 'client_password';
  static const String client_locationkey = 'client_location';

  Map<String, dynamic> toJson({bool local = false}) {
    return {
      if (local) ...{
        client_idKey: client_id,
      },
      client_nameKey: client_name,
      imageUrlKey: imageUrl,
      client_emailKey: client_email,
      client_phoneKey: client_phone,
      client_biokey: client_bio,
      client_genderkey: client_gender,
      client_fieldkey: client_field,
      client_passwordkey: client_password,
      client_locationkey: client_location,
    };
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    client_id = json[client_idKey];
    client_name = json[client_nameKey];
    imageUrl = json[imageUrlKey];
    client_phone = json[client_phoneKey];
    client_email = json[client_emailKey];
    client_bio = json[client_biokey];
    client_gender = json[client_genderkey] ?? 0;
    client_field = json[client_fieldkey];
    client_password = json[client_passwordkey];
    client_location = json[client_locationkey];
  }

  Map<String, dynamic?> toMap() {
    return {
      'client_name': client_name,
      'client_email': client_email,
      'client_phone': client_phone,
      'client_bio': client_bio,
      'client_gender': client_gender,
      'client_field': client_field,
      'client_password': client_password,
      'client_location': client_location,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      //client_id: map['client_id'],
      client_name: map['client_name'],
      client_email: map['client_email'],
      client_phone: map['client_phone'],
      client_bio: map['client_bio'],
      client_gender: map['client_gender'],
      client_field: map['client_field'],
      client_password: map['client_password'],
      client_location: map['client_location'],
    );
  }
}
