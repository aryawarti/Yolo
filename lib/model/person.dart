import 'package:cloud_firestore/cloud_firestore.dart';

class Person{
      // personal info
   String? uid;
   String? imageProfile;
   String? email;
   String? password;
   String?  name;
   int? age ;
   String? phone;
   String? city ;
   String? country;
   String? profileHeading;
   String? lookingForInPartner;
   int? publishedDateTime;

   // Appearance
   String? height ;
   String? weight;
   String? bodyType;

   // life style
   String? drink;
   String? smoke;
   String? martialStatus;
   String? haveChildren;
   String? noOfChildren;
   String? profession;
   String? employmentStatus;
   String? income;
   String? livingSituation;
   String? willingToRelocate;
   String? RelationshipYouareLookingFor;

   // Background-Cultural Values
    String? nationality;
    String? education;
    String? languageSpoken;
    String? religion;
    String? ethnicity;

    Person({
       // personal info
       this.uid,
       this.imageProfile,
       this.email,
       this.password,
       this.name,
       this.age ,
       this.phone,
       this.city ,
       this.country,
       this.profileHeading,
       this.lookingForInPartner,
       this.publishedDateTime,
       // Appearance
       this.height ,
       this.weight,
       this.bodyType,

       // life style
       this.drink,
       this.smoke,
       this.martialStatus,
       this.haveChildren,
       this.noOfChildren,
       this.profession,
       this.employmentStatus,
       this.income,
       this.livingSituation,
       this.willingToRelocate,
       this.RelationshipYouareLookingFor,

       this.nationality,
       this.education,
       this.languageSpoken,
       this.religion,
       this.ethnicity,
});

  static Person fromDataSnapshot(DocumentSnapshot snapshot)
  {
      var dataSnapshot= snapshot.data() as Map<String,dynamic>;
        return Person(
           // personal info
            uid:dataSnapshot["uid"],
            imageProfile:dataSnapshot["imageProfile"],
             email: dataSnapshot["email"],
            password: dataSnapshot["password"],
            name:dataSnapshot["name"],
            age:dataSnapshot["age"],
           phone:dataSnapshot["phone"],
           city :dataSnapshot["city"],
             country:dataSnapshot["country"],
           lookingForInPartner:dataSnapshot["lookingForInPartner"],
          publishedDateTime:dataSnapshot["publishedDateTime"],

            // Appearance
            height :dataSnapshot["height"],
            bodyType:dataSnapshot["bodyType"],

            // life style
            drink:dataSnapshot["drink"],
            smoke:dataSnapshot["smoke"],
            martialStatus:dataSnapshot["martialStatus"],
            haveChildren:dataSnapshot["haveChildren"],
             noOfChildren:dataSnapshot["noOfChildren"],
            profession:dataSnapshot["profession"],
            employmentStatus:dataSnapshot["employmentStatus"],
            income:dataSnapshot["income"],
            livingSituation:dataSnapshot["livingSituation"],
            willingToRelocate:dataSnapshot["willingSituation"],
           RelationshipYouareLookingFor:dataSnapshot["RelationshipYouareLookingFor"],

            // Background-Cultural Values
           nationality:dataSnapshot["nationality"],
           education:dataSnapshot["education"],
            languageSpoken:dataSnapshot["languageSpoken"],
           religion:dataSnapshot["religion"],
          ethnicity:dataSnapshot["ethnicity"],
        );
  }
  Map<String,dynamic> toJson()=>
      {
         // personal info
        "uid":uid,
         "imageProfile":imageProfile,
         "email":email,
         "password":password,
         "name":name,
        " age":age,
         "phone":phone,
         "city" :city,
         "country":country,
         "lookingForInPartner":lookingForInPartner,
         "publishedDateTime":publishedDateTime,

         // Appearance
         "height" :height,
         "bodyType":bodyType,

         // life style
        " drink":drink,
         "smoke":smoke,
         "martialStatus":martialStatus,
         "haveChildren":haveChildren,
         "noOfChildren":noOfChildren,
         "profession":profession,
         "employmentStatus":employmentStatus,
         "income":income,
         "livingSituation":livingSituation,
         "willingToRelocate":willingToRelocate,
         "RelationshipYouareLookingFor":RelationshipYouareLookingFor,

         // Background-Cultural Values
         "nationality":nationality,
         "education":education,
         "languageSpoken":languageSpoken,
         "religion":religion,
         "ethnicity":ethnicity,
  };
}