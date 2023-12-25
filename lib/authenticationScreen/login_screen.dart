import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yolo/Widgets/costum_textField_widgets.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:yolo/authenticationScreen/registrationScreen.dart';
import 'package:yolo/controller/authentication_controller.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   TextEditingController emailTextEditingController=TextEditingController();
   TextEditingController passwordTextEditingController=TextEditingController();
   bool showProgressbar=false;
   var controllerAuth=AuthenticationController.authController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SingleChildScrollView(
             child: Center(
               child: Column(
                 children: [
                   SizedBox(
                     height: 120,
                   ),
                   Image.asset(
                     "images/yolo1.png",
                     width: 250,
                   ),
                   SizedBox(
                     height: 40,
                   ),
                  const Text(
                     "Welcome",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                   ),
                   SizedBox(
                height:10 ,
              ),
                   const Text(
                     "Login now to find your best Match",
                     style: TextStyle(
                       fontSize: 18,
                       fontWeight: FontWeight.bold,
                     ),
                   ),

                   const SizedBox(
                     height: 28,
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
                   SizedBox(
                     height: 30,
                   ),
                  // login
                  Container(
                    width: MediaQuery.of(context).size.width-40,
                    height: 55,
                    decoration: const BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.all(
                          Radius.circular(12),
                       ),

                    ),
                    child: InkWell(
                      onTap: () async{
                          if(emailTextEditingController.text.trim().isNotEmpty
                          && passwordTextEditingController.text.trim().isNotEmpty)
                          {
                            setState(() {
                              showProgressbar =true;
                            });
                           await controllerAuth.loginUser(emailTextEditingController.text.trim(),
                               passwordTextEditingController.text.trim());
                           setState(() {
                             showProgressbar =false;
                           });
                          }
                          else{
                            Get.snackbar("Email/Password  is Missing", "Please fill all fields");
                          }
                      },
                      child:const Center(
                        child: Text(
                          "Login",
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
                     height: 16,
                   ),
                // don't have account ,create here button
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       const Text(
                         "Don't have an account?",
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
                           Get.to(RegistrationSCreen());
                         },
                         child: const Text(
                            "Create here",
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
