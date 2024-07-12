import 'package:find_me/utils/colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInformationCard extends StatelessWidget {
  const UserInformationCard({
    super.key,
    required this.username,
    required this.userid,
    required this.userbirthday,
    required this.usermobilenumber,
    required this.useremialid,
  });
  final String username;
  final String userid;
  final String userbirthday;
  final String usermobilenumber;
  final String useremialid;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 430,
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
            offset: Offset(-2, -2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text(
              'Name',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              username
              // 'Mohammed ahmed'
              ,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black.withOpacity(0.6)),
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
          ListTile(
            title: Text(
              'Username',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              userid
              //'almarwan_4'
              ,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black.withOpacity(0.6)),
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
          ListTile(
            title: Text(
              'Birthday',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              userbirthday
              //'8 march 1997'
              ,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black.withOpacity(0.6)),
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
          ListTile(
            title: Text(
              'Mobile Number',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              usermobilenumber
              // '0000 0000'
              ,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black.withOpacity(0.6)),
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
          ListTile(
            title: Text(
              'Email',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              useremialid,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black.withOpacity(0.6)),
            ),
          ),
        ],
      ),
    );
  }
}
