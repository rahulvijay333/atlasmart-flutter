import 'package:atlasmart/domain/constants/constants.dart';
import 'package:atlasmart/presentation/common/button_widget.dart';
import 'package:atlasmart/presentation/login/screen_login.dart';
import 'package:flutter/material.dart';
import '../../domain/constants/font.dart';
import '../../domain/constants/strings.dart';
import 'widgets/list_tile_widget.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          centerTitle: true,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.white,
          title: Text(AppStrings.profile, style: AppFont.appBar18Style),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 270,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(radius: 80, child: Text('Image')),
                SizedBox(height: 15),
                Text('Person Name', style: AppFont.subHeading16BoldStyle),
                Text('test@gmail.com', style: AppFont.title12Style),
              ],
            ),
          ),
        ),

        SliverPadding(
          padding: EdgeInsetsGeometry.only(
            left: 16,
            top: 5,
            right: 16,
            bottom: 5,
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              //my account
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.myAccount, style: AppFont.subHeading16BoldStyle),
                  ListTileWidget(title: AppStrings.editProfile, ontap: () {}),

                  ListTileWidget(
                    title: AppStrings.shippingAddress,
                    ontap: () {},
                  ),
                ],
              ),

              //------orders
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.myOrders, style: AppFont.subHeading16BoldStyle),
                  ListTileWidget(title: AppStrings.orderHistory, ontap: () {}),
                ],
              ),
              //-----settings
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.settings, style: AppFont.subHeading16BoldStyle),
                  ListTileWidget(title: AppStrings.appSettings, ontap: () {}),
                  ListTileWidget(
                    title: AppStrings.helpAndSupport,
                    ontap: () {},
                  ),
                ],
              ),
            ]),
          ),
        ),
        SliverToBoxAdapter(
          child: Center(
            child: Text(
              '${AppStrings.appVersion} ${AppConstants.appVersion}',
              style: AppFont.title12Style,
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsetsGeometry.only(left: 16,right: 16,top: 5,bottom: 16),
          sliver: SliverToBoxAdapter(
            child:
             ButtonWidget(title: AppStrings.logout, height: 50, ontap: () {
               Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {
                 return ScreenLogin();
               },), (route) => false,);
             },)
            
          
          ),
        ),
      ],
    );
  }
}
