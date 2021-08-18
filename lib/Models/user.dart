class User {

  late String name;
  late String email;
  late String password;
  late String mobileNumber;

  User(this.name, this.email, this.password);
  User.signUpUser(this.name, this.email, this.password, this.mobileNumber);
  User.loggedIn(this.email, this.password);


}
