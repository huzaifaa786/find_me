// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:find_me/components/appbars/topbar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,title: topBar(name: ''),),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                    children: [],
                  ),
          )),
    );
  }
}
