import 'package:flutter/material.dart';
import 'package:fmb/utils/colors.dart';
import 'package:fmb/utils/dimensions.dart';
import 'package:fmb/widgets/account_widget.dart';
import 'package:fmb/widgets/app_icon.dart';
import 'package:fmb/widgets/big_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: "Profile",
          size: 24,
          color: Colors.white,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(
          children: [
            //Profile Icon
            AppIcon(
              icon: Icons.person,
              size: Dimensions.height15 * 10,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: Dimensions.height45 + Dimensions.height30,
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
           Expanded(
             child: SingleChildScrollView(
               child: Column(
                 children: [
                   //Name
                   AccountWidget(
                       appIcon: AppIcon(
                         icon: Icons.person,
                         size: Dimensions.height30 + 20,
                         backgroundColor: AppColors.mainColor,
                         iconColor: Colors.white,
                         iconSize: Dimensions.height15 + 10,
                       ),
                       bigText: BigText(text: "Kabir Bawa")),
                   SizedBox(
                     height: Dimensions.height20,
                   ),
                   //Phone
                   AccountWidget(
                       appIcon: AppIcon(
                         icon: Icons.phone,
                         size: Dimensions.height30 + 20,
                         backgroundColor: AppColors.yellowColor,
                         iconColor: Colors.white,
                         iconSize: Dimensions.height15 + 10,
                       ),
                       bigText: BigText(text: "08189873723")),
                   SizedBox(
                     height: Dimensions.height20,
                   ),
                   //email
                   AccountWidget(
                       appIcon: AppIcon(
                         icon: Icons.email,
                         size: Dimensions.height30 + 20,
                         backgroundColor: AppColors.yellowColor,
                         iconColor: Colors.white,
                         iconSize: Dimensions.height15 + 10,
                       ),
                       bigText: BigText(text: "mohdkabiru.shek5@gmail.com")),
                   SizedBox(
                     height: Dimensions.height20,
                   ),
                   //Address
                   AccountWidget(
                       appIcon: AppIcon(
                         icon: Icons.location_on,
                         size: Dimensions.height30 + 20,
                         backgroundColor: AppColors.yellowColor,
                         iconColor: Colors.white,
                         iconSize: Dimensions.height15 + 10,
                       ),
                       bigText: BigText(text: "Fill in your location")),
                   SizedBox(
                     height: Dimensions.height20,
                   ),
                   //Address
                   AccountWidget(
                       appIcon: AppIcon(
                         icon: Icons.message,
                         size: Dimensions.height30 + 20,
                         backgroundColor: AppColors.yellowColor,
                         iconColor: Colors.white,
                         iconSize: Dimensions.height15 + 10,
                       ),
                       bigText: BigText(text: "Bawa")),
                 ],
               ),
             ),
           )

          ],
        ),
      ),
    );
  }
}
