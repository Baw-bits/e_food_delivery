import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fmb/auth/sign_up_page.dart';
import 'package:fmb/utils/colors.dart';
import 'package:fmb/utils/dimensions.dart';
import 'package:fmb/widgets/app_text_field.dart';
import 'package:fmb/widgets/big_text.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    var passwordController = TextEditingController();

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
            //welcome
            Container(
              margin: EdgeInsets.only(left: Dimensions.width20),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello",
                  style: TextStyle(
                    fontSize: Dimensions.font26*3+Dimensions.font20/2,
                    fontWeight: FontWeight.bold
                  ),),

                  Text("Sign into your account",
                    style: TextStyle(
                        fontSize: Dimensions.font20,
                        // fontWeight: FontWeight.bold
                      color: Colors.grey[500]
                    ),),
                ],
              ),
            ),
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
            //password
            AppTextField(
                textEditingController: passwordController,
                hintText: "Password",
                icon: Icons.password_sharp),
            SizedBox(
              height: Dimensions.height20,
            ),
//tag line
            Row(
              children: [
                Expanded(child: Container()),
                RichText(
                    text: TextSpan(
                        text: "Sign into your account",
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimensions.font20
                        )
                    )),
                SizedBox(width: Dimensions.width20,)
              ],
            ),
            SizedBox(height: Dimensions.screenHeight*0.05,),
            // sign up button
            Container(
              width: Dimensions.screenWidth/2,
              height: Dimensions.screenHeight/13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: AppColors.mainColor,
              ),
              child: Center(
                child: BigText(
                  text: 'Sign in',
                  size: Dimensions.font20+Dimensions.font20/2,
                  color: Colors.white,),),
            ),
            SizedBox(height: Dimensions.screenHeight*0.05,),

            //sign up options
            RichText(
                text: TextSpan(
                    text: "Don't have an account?",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: Dimensions.font20
                    ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>const SignUpPage(), transition: Transition.fade),
                    text: " Create",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                        color: AppColors.mainBlackColor,
                        fontSize: Dimensions.font20
                    ))
                  ]
                )),

          ],
        ),
      ),
    );
  }
}
