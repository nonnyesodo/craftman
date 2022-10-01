import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Mesaves extends StatelessWidget {
  String fullname, address, phone, job;
  Mesaves(
      {Key? key,
      required this.address,
      required this.fullname,
      required this.job,
      required this.phone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(child: Text('fullname:$fullname')),
            Card(child: Text('address:$address')),
            Card(child: Text('job:$job')),
            Card(child: Text('phone:$phone')),
          ],
        ),
      ),
    );
  }
}
