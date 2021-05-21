import 'package:flutter/foundation.dart';

class UserEntity {
  int id;
  String mobile;
  String firstname;
  String surname;
  String username;
  String email;
  String dateOfBirth;
  String age;
  String gender;
  String location;
  bool mask;
  String profileHeadLine;
  String executiveSummary;
  String workAndEducation;
  String job;
  String sector;
  String institutionName;
  String languages;
  String highestLevelOfEducation;
  String highestSchoolName;
  String businessAspirations;
  String lastLogin;
  bool isActive;
  String dateJoined;
  bool verificationStatus;
  String referralLink;
  String goals;

  UserEntity(
      {@required this.id,
      this.mobile,
      this.firstname,
      this.surname,
      this.username,
      this.email,
      this.dateOfBirth,
      this.age,
      this.gender,
      this.location,
      this.mask,
      this.institutionName,
      this.profileHeadLine,
      this.executiveSummary,
      this.workAndEducation,
      this.job,
      this.languages,
      this.highestSchoolName,
      this.lastLogin,
      this.isActive,
      this.dateJoined,
      this.verificationStatus,
      this.referralLink,
      this.goals});
}
