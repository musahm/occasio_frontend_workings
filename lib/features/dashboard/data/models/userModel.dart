import 'package:occasio_frontend_workings/features/dashboard/domain/entities/userEntity.dart';

class UserModel extends UserEntity {
  UserModel(
      {int id,
      String mobile,
      String firstname,
      String surname,
      String username,
      String email,
      String dateOfBirth,
      String age,
      String gender,
      String location,
      bool mask,
      String institutionName,
      String profileHeadLine,
      String executiveSummary,
      String workAndEducation,
      String job,
      String languages,
      String highestSchoolName,
      String lastLogin,
      bool isActive,
      String dateJoined,
      bool verificationStatus,
      String referralLink,
      String goals})
      : super(
            id: id,
            firstname: firstname,
            surname: surname,
            username: username,
            email: email,
            dateOfBirth: dateOfBirth,
            age: age,
            gender: gender,
            location: location,
            mask: mask,
            institutionName: institutionName,
            profileHeadLine: profileHeadLine,
            executiveSummary: executiveSummary,
            workAndEducation: workAndEducation,
            job: job,
            languages: languages,
            highestSchoolName: highestSchoolName,
            lastLogin: lastLogin,
            isActive: isActive,
            dateJoined: dateJoined,
            verificationStatus: verificationStatus,
            referralLink: referralLink,
            goals: goals);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    // print(json);
    return UserModel(
      id: json["id"],
      mobile: json["mobile"],
      firstname: json["first_name"],
      email: json["email"],
      surname: json["surname"],
      username: json["username"],
      dateOfBirth: json["date_of_dirth"],
      age: json["age"],
      gender: json["gender"],
      location: json["location"],
      mask: json["mask"],
      profileHeadLine: json["profile_headline"],
      executiveSummary: json["executive_summary"],
      job: json["job"],
      institutionName: json["institution_name"],
      languages: json["languages"],
      highestSchoolName: json["highest_school_name"],
      lastLogin: json["last_login"],
      isActive: json["is_active"],
      dateJoined: json["date_joined"],
      verificationStatus: json["verification_status"],
      referralLink: json["referral_link"],
      goals: json["goals"],
    );
  }

  factory UserModel.dummyModel() {
    return UserModel(
      id: 1,
      firstname: "dummy-FirstName",
      mobile: "dummy-Number",
      email: "dummy-Email",
      surname: "dummy-Surname",
    );
  }
}
