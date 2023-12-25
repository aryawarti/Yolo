import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yolo/authenticationScreen/login_screen.dart';
import 'package:yolo/homeScreen/home_screen.dart';
import 'package:yolo/model/person.dart' as personModel;


class AuthenticationController extends GetxController{
      static AuthenticationController authController= Get.find();
      late Rx<File?> pickedFile;
      File? get profileImage=> pickedFile.value;
      XFile? imageFile;
      // ye niche wala instance checkUserLoggedIn ke liye hai
       late Rx<User?> firebaseCurrentuser;
      pickedImageFileFromGallery() async{
            imageFile= await ImagePicker().pickImage(source:ImageSource.gallery);
            if(imageFile!=null){
                  Get.snackbar("Profile Image","you have successfully picked your profile image from gallery.");
             }

            pickedFile= Rx<File?>(File(imageFile!.path));
      }

      captureImageFromCamera() async{
            imageFile= await ImagePicker().pickImage(source:ImageSource.camera);
            if(imageFile!=null){
                  Get.snackbar("Profile Image","you have successfully capture your image using camera.");
            }

            pickedFile= Rx<File?>(File(imageFile!.path));
      }
   Future<String> uploadImageToStorage(File imageProfile) async{
                  Reference referenceStorage= FirebaseStorage.instance.ref()
                  .child("Profile Images")
                  .child(FirebaseAuth.instance.currentUser!.uid);
               UploadTask task=referenceStorage.putFile(imageProfile);
               TaskSnapshot snapshot=await task;
               String downloadUrlOfImage= await snapshot.ref.getDownloadURL();
                return downloadUrlOfImage;

      }
       createNewUserAccount(
           File imageProfile,String email,String password,String name,String age,String phone,String city, String country, String profileHeading,String lookingForInPartner,
         String height,String weight,String bodyType, String drink,String smoke, String martialStatus,String haveChildren
          , String noOfChildren,String profession,String employmentStatus,String income,String livingSituation,String willingToRelocate,String RelationshipYOuareLokingFor,
           String nationality,String education,String languageSpoken,String religion,
           String ethnicity) async{
         try{
           // authentice user and create use with email and password
              UserCredential credential=await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: email,
                  password: password);
              // upload image to storage
              String urlOfDownLoadImage=  await uploadImageToStorage(imageProfile);
            // save user info to firestore databse
           personModel.Person personInstance= personModel.Person(

             // personal info
              uid: FirebaseAuth.instance.currentUser!.uid,
             imageProfile: urlOfDownLoadImage,
             email: email,
             password: password,
             name: name,
             age: int.parse(age),
             phone: phone,
             city: city,
             country: country,
             profileHeading: profileHeading,
             lookingForInPartner: lookingForInPartner,
             publishedDateTime: DateTime.now().millisecondsSinceEpoch,

             // Appearance
             height: height,
             weight: weight,
             bodyType: bodyType,

             // Life style
             drink: drink,
             smoke: smoke,
             martialStatus: martialStatus,
             haveChildren: haveChildren,
             noOfChildren: noOfChildren,
             profession: profession,
             employmentStatus: employmentStatus,
             income: income,
             livingSituation: livingSituation,
             willingToRelocate: willingToRelocate,
             RelationshipYouareLookingFor: RelationshipYOuareLokingFor,

             // backGround_cultural values
             nationality: nationality,
             education: education,
             languageSpoken: languageSpoken,
             religion: religion,
             ethnicity: ethnicity,
           );

           await FirebaseFirestore.instance.collection("users")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .set(personInstance.toJson());
           Get.snackbar("Account Created","user account has been created");
           Get.to(HomeScreen());

         }
         catch(errorMsg){
            Get.snackbar("Account Creation Unsuccessful","Error occured: $errorMsg");
         }
       }

       loginUser(String emailUsr, String passwordUser)async{
              try{
                 await FirebaseAuth.instance.signInWithEmailAndPassword(
                     email: emailUsr,
                     password: passwordUser);
                 Get.snackbar("Logged in Successful","you're logged in successfully");

                 Get.to(HomeScreen());
              }
              catch(error){
                Get.snackbar("Login Unsuccessful","Error occured $error");
              }
       }

       checkIfUserloggedIn(User? currentUser){
            if(currentUser==null){
                Get.to(LoginScreen());
            }
            else{
              Get.to(HomeScreen());
            }
       }
       @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    firebaseCurrentuser= Rx<User?>(FirebaseAuth.instance.currentUser);
    firebaseCurrentuser.bindStream(FirebaseAuth.instance.authStateChanges());
     ever(firebaseCurrentuser,checkIfUserloggedIn);
  }

}