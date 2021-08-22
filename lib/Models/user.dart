class User {
  late String userName;
  late String name;
  late String password;
  late String mobileNumber;
  late int gender;

  User(this.name, this.password);
  User.signUpUser(this.userName,this.name, this.password, this.mobileNumber,this.gender);
  User.loggedIn(this.mobileNumber, this.password);


}
