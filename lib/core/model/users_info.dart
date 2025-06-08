import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String uid;
  final bool isNewUser;
  final String provider;
  final DateTime? createdAt;
  final ProfileData profile;

  UserModel({
    required this.email,
    required this.uid,
    required this.isNewUser,
    required this.provider,
    this.createdAt,
    required this.profile,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] ?? '',
      uid: map['uid'] ?? '',
      isNewUser: map['isNewUser'] ?? false,
      provider: map['provider'] ?? '',
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : null,
      profile: ProfileData.fromMap(Map<String, dynamic>.from(map['profile'] ?? {})),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'uid': uid,
      'isNewUser': isNewUser,
      'provider': provider,
      'createdAt': createdAt,
      'profile': profile.toMap(),
    };
  }
}

class ProfileData {
  final String? name;
  final String? givenName;
  final String? familyName;
  final String? picture;
  final String? email;
  final bool? emailVerified;
  final String? sub;

  ProfileData({
    this.name,
    this.givenName,
    this.familyName,
    this.picture,
    this.email,
    this.emailVerified,
    this.sub,
  });

  factory ProfileData.fromMap(Map<String, dynamic> map) {
    return ProfileData(
      name: map['name'],
      givenName: map['given_name'],
      familyName: map['family_name'],
      picture: map['picture'],
      email: map['email'],
      emailVerified: map['email_verified'],
      sub: map['sub'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'given_name': givenName,
      'family_name': familyName,
      'picture': picture,
      'email': email,
      'email_verified': emailVerified,
      'sub': sub,
    };
  }
}
