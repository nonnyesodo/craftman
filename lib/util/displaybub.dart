import 'package:flutter/material.dart';

class Displaybub extends StatelessWidget {
  const Displaybub(
      {Key? key,
      required this.fullname,
      required this.address,
      required this.phone,
      required this.job})
      : super(key: key);
  final String address;
  final String fullname;
  final String phone;
  final String job;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(15.0),
        color: const Color(0xFF262b50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 13.0),
              child: Text(
                'Fullname =>      $fullname',
                style: const TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 13.0),
              child: Text(
                'Address  =>      $address',
                style: const TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 13.0),
              child: Text(
                'Phone    =>      $phone',
                style: const TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 13.0),
              child: Text(
                'Skill      =>       $job',
                style: const TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
