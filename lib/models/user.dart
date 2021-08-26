import 'package:flutter/material.dart';

class User {
  String firstname;
  String lastname;
  String email;
  String phone;
  String project;

  User(
      {Key key,
      this.firstname,
      this.lastname,
      this.email,
      this.phone,
      this.project});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      'phone': phone,
      'project': project,
    };
  }

  @override
  String toString() {
    return 'User{email: $email, firstname: $firstname, lastname: $lastname, lastname: $phone, project: $project}';
  }
}
