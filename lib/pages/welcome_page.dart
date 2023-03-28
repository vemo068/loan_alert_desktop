import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Column(
            children: [
              Text("Welcome to NotiLoans",),
              Text("Track who you owe and who owes you money with ease. Manage your debts and keep a clear record of transactions with our app.")
            ],
          ),
          Column(),
        ],
      )),
    );
  }
}