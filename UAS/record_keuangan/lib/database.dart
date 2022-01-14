class UserModel {
  String? uid;
  String? username;
  String? email;
  String? password;

  UserModel({this.uid, this.username, this.email, this.password});

  factory UserModel.formMap(map) {
    return UserModel(
      uid: map['uid'],
      username: map['username'],
      email: map['email'],
      password: map['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'password': password
    };
  }
}
