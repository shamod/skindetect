class User {
  String name;
  String email;
  String password;

  Map<String, dynamic> toJson() => {
    'name' : name,
    'email' : email,
    'password' : password,
  };
}