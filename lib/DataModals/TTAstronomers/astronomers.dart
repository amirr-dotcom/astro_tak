



class AstronomersDataModal {
  String? id;
  String? urlSlug;
  String? namePrefix;
  String? firstName;
  String? lastName;
  String? aboutMe;
  String? profilePicUrl;
  String? experience;
  List? languages;
  String? minimumCallDurationCharges;
  List? skills;

  AstronomersDataModal(
      {
        this.id,
        this.urlSlug,
        this.namePrefix,
        this.firstName,
        this.lastName,
        this.aboutMe,
        this.profilePicUrl,
        this.experience,
        this.languages,
        this.minimumCallDurationCharges,
        this.skills,
      });

  factory AstronomersDataModal.fromJson(Map<String, dynamic> json) => AstronomersDataModal(
    id: (json['id']??'').toString(),
    urlSlug: (json['urlSlug']??'').toString(),
    namePrefix: (json['namePrefix']??'').toString(),
      firstName: (json['firstName']??'').toString(),
      lastName: (json['lastName']??'').toString(),
      aboutMe: (json['aboutMe']??'').toString(),
      profilePicUrl: (json['images']['medium']['imageUrl']).toString(),
      experience: (json['experience']??'').toString(),
      languages: (json['languages']??[]) as List,
      minimumCallDurationCharges: (json['minimumCallDurationCharges']??'').toString(),
      skills: (json['skills']??[]) as List,
  );


}