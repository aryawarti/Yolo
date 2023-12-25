import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:yolo/controller/authentication_controller.dart';

import '../Widgets/costum_textField_widgets.dart';
class RegistrationSCreen extends StatefulWidget {
  const RegistrationSCreen({Key? key}) : super(key: key);

  @override
  State<RegistrationSCreen> createState() => _RegistrationSCreenState();
}

class _RegistrationSCreenState extends State<RegistrationSCreen> {
     // personal info
  TextEditingController emailTextEditingController= TextEditingController();
  TextEditingController passwordTextEditingController= TextEditingController();
  TextEditingController nameTextEditingController= TextEditingController();
  TextEditingController ageTextEditingController= TextEditingController();
  TextEditingController phoneTextEditingController= TextEditingController();
  TextEditingController cityTextEditingController= TextEditingController();
  TextEditingController countryTextEditingController=TextEditingController();
  TextEditingController profileHeadingTextEditingController=TextEditingController();
  TextEditingController lookingForPartenerTextEditingController=TextEditingController();

    // Apperance
  TextEditingController heightTextEditingController=TextEditingController();
  TextEditingController weightTextEditingController=TextEditingController();
  TextEditingController bodyTypeTextEditingController=TextEditingController();

  // Life style
  TextEditingController drinkTextEditingController=TextEditingController();
  TextEditingController smokeTextEditingController=TextEditingController();
  TextEditingController martialStatusTextEditingController=TextEditingController();
  TextEditingController haveChildrenTextEditingController=TextEditingController();
  TextEditingController noOfChildrenTextEditingController=TextEditingController();
  TextEditingController professionTextEditingController=TextEditingController();
  TextEditingController employmentStatusTextEditingController=TextEditingController();
  TextEditingController incomeTextEditingController=TextEditingController();
  TextEditingController livingSituationTextEditingController=TextEditingController();
  TextEditingController willingToRelocateTextEditingController=TextEditingController();
  TextEditingController RelationshipYouareLooingForTextEditingController=TextEditingController();
    // Background- Cultural Values
  TextEditingController nationalityTextEditingController=TextEditingController();
  TextEditingController educationTextEditingController=TextEditingController();
  TextEditingController languageSpokenTextEditingController=TextEditingController();
  TextEditingController religionTextEditingController=TextEditingController();
  TextEditingController ethnicityTextEditingController=TextEditingController();


   bool showProgressbar=false;

    var authenticationController= AuthenticationController.authController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              const Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 10,
              ),
          const Text(
            "to get Started Now",
            style: TextStyle(
              fontSize: 22,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
              const SizedBox(
                height: 20,
              ),

              // choose image circlular avatar
               authenticationController.imageFile==null?
              const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(
                    "images/profile_avatar.jpg"
                ),
                backgroundColor: Colors.black,
              ):Container(
                 width: 180,
                 height: 180,
                 decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   color: Colors.grey,
                   image: DecorationImage(
                       fit:BoxFit.fitWidth,

                     image: FileImage(
                         File(
                           authenticationController.imageFile!.path,
                         )
                     )
                   ),
                 ),
               ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed:() async{
                         await authenticationController.pickedImageFileFromGallery();
                           setState(() {
                              authenticationController.imageFile;
                           });

                         },
                        icon:const Icon(
                          Icons.image_outlined,
                          color:Colors.grey,
                          size: 30,
                        )),
                    const SizedBox(
                      width:5,
                    ),
                    IconButton(
                        onPressed:() async{
                        await  authenticationController.captureImageFromCamera();
                          setState(() {
                            authenticationController.imageFile;
                          });

                        },
                        icon:const Icon(
                          Icons.camera_alt_outlined,
                          color:Colors.grey,
                          size: 30,
                        )),
                  ],
                ),

             const SizedBox(
                height: 25,
              ),
              const Text(
                "Personal Info  :",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              // personal info
              // name
              SizedBox(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: nameTextEditingController,
                  labelText: "Name",
                  iconData: Icons.person_outlined,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 26,
              ),
             // email
              SizedBox(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: emailTextEditingController,
                  labelText: "Email",
                  iconData: Icons.email_outlined,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              // password
              SizedBox(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: passwordTextEditingController,
                  labelText: "Password",
                  iconData: Icons.lock_outlined,
                  isObscure: true,
                ),
              ),
               // age
              const SizedBox(
                height: 26,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: ageTextEditingController,
                  labelText: "Age",
                  iconData: Icons.numbers,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              // phoneNo
              SizedBox(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: phoneTextEditingController,
                  labelText: "Phone",
                  iconData: Icons.phone,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              // city
              SizedBox(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: cityTextEditingController,
                  labelText: "City",
                  iconData: Icons.location_city,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              // country
              SizedBox(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: countryTextEditingController,
                  labelText: "Country",
                  iconData: Icons.location_city_sharp,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              // profileHeading
              SizedBox(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: profileHeadingTextEditingController,
                  labelText: "Profile Heading",
                  iconData: Icons.text_fields,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              // lookingForPartner
              SizedBox(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: lookingForPartenerTextEditingController,
                  labelText: "What yo u're looking for in a partner",
                  iconData: Icons.email_outlined,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              // appearacne
              const Text(
                "Appearance :",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // height
              SizedBox(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController:heightTextEditingController,
                  labelText: "Height",
                  iconData: Icons.insert_chart,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // weight
              SizedBox(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController:weightTextEditingController,
                  labelText: "Weight",
                  iconData: Icons.table_chart,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // body type
              SizedBox(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController:bodyTypeTextEditingController,
                  labelText: "Body Type",
                  iconData: Icons.type_specimen,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 12,
              ),

                // Life Style
              const Text(
                "Life style :",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // drink
              SizedBox(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController:drinkTextEditingController,
                  labelText: "Drink",
                  iconData: Icons.local_drink_outlined,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // smoke
              SizedBox(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController:smokeTextEditingController,
                  labelText: "Smoke",
                  iconData: Icons.smoking_rooms,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // martial status
              SizedBox(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController:martialStatusTextEditingController,
                  labelText: "Martial Status",
                  iconData: Icons.person_2,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // have children
              SizedBox(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController:haveChildrenTextEditingController,
                  labelText: "Do you have children?",
                  iconData: Icons.person_3,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // Number of children
              SizedBox(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController:noOfChildrenTextEditingController,
                  labelText: "Number of children",
                  iconData: Icons.person,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // profession
              SizedBox(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController:professionTextEditingController,
                  labelText: "Profession",
                  iconData: Icons.business_center,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // employementStatus
              SizedBox(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController:employmentStatusTextEditingController,
                  labelText: "Employment Status",
                  iconData: CupertinoIcons.rectangle_stack_person_crop_fill,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // income
              SizedBox(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController:incomeTextEditingController,
                  labelText: "Income",
                  iconData: CupertinoIcons.money_dollar_circle,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // Living situation
              SizedBox(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController:livingSituationTextEditingController,
                  labelText: "Living Situation (alone/family)",
                  iconData: CupertinoIcons.person_2_square_stack,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              //  willingToRelocate
              SizedBox(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController:willingToRelocateTextEditingController,
                  labelText: "Are you willing to relocate?(yes/no)",
                  iconData: Icons.time_to_leave,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // relationshipYouAreLookingFor
              SizedBox(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController:RelationshipYouareLooingForTextEditingController,
                  labelText:"What relationship you are looking for?",
                  iconData: CupertinoIcons.eye,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 12,
              ),

              // background-cultural values
              const Text(
                "Background - Cultural Values :",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // nationality of person
              SizedBox(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController:nationalityTextEditingController,
                  labelText: "Nationality",
                  iconData: Icons.flag_circle_outlined,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // education
              SizedBox(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController:educationTextEditingController,
                  labelText: "Education",
                  iconData: Icons.history_edu,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // language spoken
              SizedBox(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController:languageSpokenTextEditingController,
                  labelText: "Language Spoken",
                  iconData: CupertinoIcons.person_badge_plus_fill,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // religion
              SizedBox(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController:religionTextEditingController,
                  labelText: "Religion",
                  iconData: CupertinoIcons.checkmark_seal_fill,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // ethnicity
              SizedBox(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController:ethnicityTextEditingController,
                  labelText: "Ethnicity",
                  iconData: Icons.remove_red_eye_rounded,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // create button
              Container(
                width: MediaQuery.of(context).size.width-170,
                height: 55,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),

                ),
                child: InkWell(
                  onTap: () async
                  {
                     if(authenticationController.imageFile!=null)
                     {
                        if(nameTextEditingController.text.trim().isNotEmpty
                        && emailTextEditingController.text.trim().isNotEmpty
                        && passwordTextEditingController.text.trim().isNotEmpty
                        && ageTextEditingController.text.trim().isNotEmpty
                        && phoneTextEditingController.text.trim().isNotEmpty
                        && cityTextEditingController.text.trim().isNotEmpty
                        && countryTextEditingController.text.trim().isNotEmpty
                        && profileHeadingTextEditingController.text.trim().isNotEmpty
                        && lookingForPartenerTextEditingController.text.trim().isNotEmpty

                        && heightTextEditingController.text.trim().isNotEmpty
                        && weightTextEditingController.text.trim().isNotEmpty
                        && bodyTypeTextEditingController.text.trim().isNotEmpty

                        && drinkTextEditingController.text.trim().isNotEmpty
                        && smokeTextEditingController.text.trim().isNotEmpty
                        && martialStatusTextEditingController.text.trim().isNotEmpty
                        && haveChildrenTextEditingController.text.trim().isNotEmpty
                        && noOfChildrenTextEditingController.text.trim().isNotEmpty
                        && professionTextEditingController.text.trim().isNotEmpty
                        && employmentStatusTextEditingController.text.trim().isNotEmpty
                        && incomeTextEditingController.text.trim().isNotEmpty
                        && livingSituationTextEditingController.text.trim().isNotEmpty
                        && willingToRelocateTextEditingController.text.trim().isNotEmpty
                        && RelationshipYouareLooingForTextEditingController.text.trim().isNotEmpty

                        && nationalityTextEditingController.text.trim().isNotEmpty
                        && educationTextEditingController.text.trim().isNotEmpty
                        && languageSpokenTextEditingController.text.trim().isNotEmpty
                        && religionTextEditingController.text.trim().isNotEmpty
                        && ethnicityTextEditingController.text.trim().isNotEmpty
                        )
                          {
                            setState(() {
                              showProgressbar=true;
                            });
                          await  authenticationController.createNewUserAccount(

                                authenticationController.profileImage!,
                                emailTextEditingController.text.trim(),
                                 passwordTextEditingController.text.trim()!,
                                 nameTextEditingController.text.trim()!,
                                 ageTextEditingController.text.trim()!,
                                 phoneTextEditingController.text.trim()!,
                                 cityTextEditingController.text.trim()!,
                                 countryTextEditingController.text.trim()!,
                                 profileHeadingTextEditingController.text.trim()!,
                                 lookingForPartenerTextEditingController.text.trim()!,

                                heightTextEditingController.text.trim()!,
                                weightTextEditingController.text.trim()!,
                                bodyTypeTextEditingController.text.trim()!,

                                drinkTextEditingController.text.trim()!,
                                smokeTextEditingController.text.trim()!,
                                martialStatusTextEditingController.text.trim()!,
                                haveChildrenTextEditingController.text.trim()!,
                                noOfChildrenTextEditingController.text.trim()!,
                                 professionTextEditingController.text.trim()!,
                                employmentStatusTextEditingController.text.trim()!,
                                incomeTextEditingController.text.trim()!,
                                livingSituationTextEditingController.text.trim()!,
                                willingToRelocateTextEditingController.text.trim()!,
                                RelationshipYouareLooingForTextEditingController.text.trim()!,

                                nationalityTextEditingController.text.trim()!,
                                educationTextEditingController.text.trim()!,
                                languageSpokenTextEditingController.text.trim()!,
                                religionTextEditingController.text.trim()!,
                                ethnicityTextEditingController.text.trim()!

                            );
                          setState(() {
                            showProgressbar=false;
                            authenticationController.imageFile=null;
                          });

                          }
                        else{
                           Get.snackbar("A Field is Empty","Please fill out all field iin text fields") ;
                        }
                     }
                     else{
                       Get.snackbar("Image File Missing","Please pick image from Gallery or capture with Camera");
                     }
                  },
                  child:const Center(
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                  ),

                ),

              ),

              const SizedBox(
                height: 15,
              ),
              // already have account ,login here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: const Text(
                      "Login here",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ],
              ),
              const SizedBox(
                height: 16,
              ),
              showProgressbar==true?Container(
                child: const SimpleCircularProgressBar(
                  progressColors: [
                    Colors.green,
                    Colors.blueAccent,
                    Colors.red,
                    Colors.amber,
                    Colors.purpleAccent,
                  ],
                  animationDuration: 3,
                  backColor: Colors.white38,
                ),
              ):Container(),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
