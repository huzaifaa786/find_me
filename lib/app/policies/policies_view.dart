// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PoliciesView extends StatelessWidget {
  const PoliciesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
      
        title: topBar(name: 'Terms & Policies'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          
          Row(
            children: [
              Gap(52.w),
              AppText(
                title:
                    'Conditions of use By using this app, you certify that you have read and reviewed this Agreement and that you agree to comply with its terms. If you do not want to be bound by the terms of this Agreement, you are advised to stop using the app accordingly. [company name] only grants use and access of this app, its products, and its services to those who have accepted its terms. Privacy policy Before you continue using our app, we advise you to read our privacy policy [link to privacy policy] regarding our user data collection. It will help you better understand our practices. Age restriction You must be at least 18 (eighteen) years of age before you can use this app. By using this app, you warrant that you are at least 18 years of age and you may legally adhere to this Agreement. [company name] assumes no responsibility for liabilities related to age misrepresentation. Intellectual property You agree that all materials, products, and services provided on this app are the property of [company name], its affiliates, directors, officers, employees, agents, suppliers, or licensors including all copyrights, trade secrets, trademarks, patents, and other intellectual property. You also agree that you will not reproduce or redistribute the [company name]’s intellectual property in any way, including electronic, digital, or new trademark registrations. You grant [company name] a royalty-free and non-exclusive license to display, use, copy, transmit, and broadcast the content you upload and publish. For issues regarding intellectual property claims, you should contact the company in order to come to an agreement. User accounts As a user of this app, you may be asked to register with us and provide private information. You are responsible for ensuring the accuracy of this information, and you are responsible for maintaining the safety and security of your identifying information.',
                size: 10,
                fontWeight: FontWeight.w500,
              ),
              Gap(52.w),

            ],
          )
        ],
      )),
    );
  }
}
