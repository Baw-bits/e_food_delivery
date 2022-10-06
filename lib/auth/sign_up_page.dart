import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fmb/base/show_custom_snackbar.dart';
import 'package:fmb/controllers/auth_controller.dart';
import 'package:fmb/utils/colors.dart';
import 'package:fmb/utils/dimensions.dart';
import 'package:fmb/widgets/app_text_field.dart';
import 'package:fmb/widgets/big_text.dart';
import 'package:get/get.dart';

import '../modules/signup_body_model.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    var nameController = TextEditingController();
    var passwordController = TextEditingController();
    var signupImages =[
      't.png',
      'f.png',
      'g.png'
    ];
    void _registration(){
      var authController = Get.find<AuthController>();
      String name = nameController.text.trim();
      String email = emailController.text.trim();
      String phone = phoneController.text.trim();
      String password = passwordController.text.trim();
      if(name.isEmpty){
      showCustomSnackBar('Type in your name', title: 'Name');
      }else if(phone.isEmpty){
        showCustomSnackBar('Type in your phone number', title: 'Phone number');
      }else if(email.isEmpty){
        showCustomSnackBar('Type in a valid Email address', title: 'Email address');
      }else if(!GetUtils.isEmail(email)){
        showCustomSnackBar('Type in a valid email address', title: 'Valid email address');
      }else if(password.isEmpty){
        showCustomSnackBar('Type in your Password', title: 'Password');
      }else if(password.length<6){
        showCustomSnackBar('Password must not be less than 6 characters ', title: 'Password');
      }else{
        showCustomSnackBar('All went well', title: 'Perfect');
        SignUpBody signUpBody = SignUpBody(
            name: name,
            phone: phone,
            email: email,
            password: password,
        );
        authController.registration(signUpBody).then((status){
          if(status.isSuccess){
            print('Success registration');
          }else{
            showCustomSnackBar(status.message);
          }
        });
      }
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.screenHeight * 0.05,
            ),
            //app logo
            Container(
              height: Dimensions.screenHeight * 0.25,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 80,
                  backgroundImage: AssetImage('assets/image/logo part 1.png'),
                ),
              ),
            ),
            //email
            AppTextField(
                textEditingController: emailController,
                hintText: 'Email',
                icon: Icons.email),
            SizedBox(
              height: Dimensions.height20,
            ),
            //password
            AppTextField(
                textEditingController: passwordController,
                hintText: "Password",
                icon: Icons.password_sharp),
            SizedBox(
              height: Dimensions.height20,
            ),
            //name
            AppTextField(
                textEditingController: nameController,
                hintText: 'Name',
                icon: Icons.person),
            SizedBox(
              height: Dimensions.height20,
            ),
            //phone
            AppTextField(
                textEditingController: phoneController,
                hintText: 'Phone',
                icon: Icons.phone),
            SizedBox(
              height: Dimensions.height20,
            ),
            // sign up button
            GestureDetector(
              onTap: (){
                _registration();
              },
              child: Container(
                width: Dimensions.screenWidth/2,
                height: Dimensions.screenHeight/13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: AppColors.mainColor,
                ),
                child: Center(
                    child: BigText(
                      text: 'Sign Up',
                      size: Dimensions.font20+Dimensions.font20/2,
                      color: Colors.white,),),
              ),
            ),
            SizedBox(height: Dimensions.height10,),
            //tag line
            RichText(
                text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                  text: "Have an account already?",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimensions.font20
                  )
                )),
            SizedBox(height: Dimensions.screenHeight*0.05,),
            //sign up options
            RichText(
                text: TextSpan(
                    text: "Sign up using one of the following methods",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: Dimensions.font16
                    )
                )),
            Wrap(
              children: List.generate(3, (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: Dimensions.radius30,
                  backgroundImage: AssetImage(
                    "assets/image/"+signupImages[index]
                  ),
                ),
              )),
            )
          ],
        ),
      ),
    );

  }
}
