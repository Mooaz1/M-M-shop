class UserModel {
  String ?name;
  String ?email;
  String ?password;
  String ?picture;
  String? phoneNumber;
  String ?uid;
  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.picture,
    required this.uid,
    required this.phoneNumber
  });
  UserModel.fromJson(Map<dynamic,dynamic> user){
    if(user==null)
    {
      return;
    }
    name=user['name'];
    phoneNumber=user["phoneNumber"];
    email=user['email'];
    password=user['password'];
    picture=user['picture'];
    uid=user['uid'];


  }
  tojson(){
    return {
      'name':name,
      'email':email,
      'password':password,
      'picture':picture,
      'uid':uid,
      "phoneNumber":phoneNumber
    };
  }
}
