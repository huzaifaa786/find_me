import 'package:find_me/app/languages/language_card.dart';
import 'package:find_me/app/user_account/user_account_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/cards/user_information_card.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class UserAccountView extends StatefulWidget {
  const UserAccountView({super.key});

  @override
  State<UserAccountView> createState() => _UserAccountViewState();
}

class _UserAccountViewState extends State<UserAccountView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserAccountController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                toolbarHeight: 83.h,
                title: topBar(name: 'Account'),
                scrolledUnderElevation: 0,
                automaticallyImplyLeading: false,
              ),
              body: SafeArea(
                  child: Container(
                padding: EdgeInsets.only(
                  left: 33,
                  right: 32,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'My information',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Gap(18),
                      UserInformationCard(
                          username: 'Mohammed ahmed',
                          userid: 'almarwan_4',
                          userbirthday: '8 march 1997',
                          usermobilenumber: '0000 0000',
                          useremialid: 'gost3@gmail.com'),
                      Gap(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Settings',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Gap(18),
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        height: 350,
                        width: 290,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(11.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(2, 2),
                            ),
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(-2, -2), // Shadow for top and left
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                'Change my information',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                              trailing: Icon(
                                Icons.chevron_right,
                                color: Colors.grey,
                              ),
                              onTap: () {
                                setState(() {});
                              },
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            ListTile(
                              title: Text(
                                'change date of birth',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                              trailing: Icon(
                                Icons.chevron_right,
                                color: Colors.grey,
                              ),
                              onTap: () {
                                setState(() {});
                              },
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            ListTile(
                              title: Text(
                                'Change mobile number',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                              trailing: Icon(
                                Icons.chevron_right,
                                color: Colors.grey,
                              ),
                              onTap: () {
                                setState(() {});
                              },
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            ListTile(
                              title: Text(
                                'Change email',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                              trailing: Icon(
                                Icons.chevron_right,
                                color: Colors.grey,
                              ),
                              onTap: () {
                                setState(() {});
                              },
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            ListTile(
                              title: Text(
                                'Change password',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                              trailing: Icon(
                                Icons.chevron_right,
                                color: Colors.grey,
                              ),
                              onTap: () {
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ));
  }
}
