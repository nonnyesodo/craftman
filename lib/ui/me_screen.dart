import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craftman/ui/mesaves.dart';
import 'package:craftman/ui/mephoto.dart';
import 'package:craftman/util/photocontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:craftman/util/mescreenkfield.dart';
import 'package:craftman/util/rounded_b.dart';
import 'package:get/get.dart';

Mephoto photo = Mephoto();

class Mesreens extends StatefulWidget {
  const Mesreens({Key? key}) : super(key: key);

  @override
  State<Mesreens> createState() => MesreensState();
}

class MesreensState extends State<Mesreens> {
  final _firestore = FirebaseFirestore.instance;

  final _auth = FirebaseAuth.instance;

  TextEditingController fullnameController = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController jobController = TextEditingController();
  Photocontroller photocontroller = Get.put(Photocontroller());

  @override
  void initState() {
    super.initState();
    getcurrentuser();
  }

  void getcurrentuser() async {
    _auth.currentUser;
    if (_auth.currentUser != null) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9AB4C2),
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            child: Column(
              children: [
                Mephoto(),
                const SizedBox(height: 20.0),
                TextField(
                  style: const TextStyle(
                    color: Color(0xFF262b50),
                  ),
                  controller: fullnameController,
                  decoration: mescreenfield.copyWith(
                    hintText: 'Enter Your Fullname',
                    labelText: 'Fullname',
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Color(0xFF262b50),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  style: const TextStyle(
                    color: Color(0xFF262b50),
                  ),
                  controller: addresscontroller,
                  decoration: mescreenfield.copyWith(
                      hintText: 'Address',
                      labelText: 'Location',
                      prefixIcon: const Icon(
                        Icons.location_pin,
                        color: Color(0xFF262b50),
                      )),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  style: const TextStyle(
                    color: Color(0xFF262b50),
                  ),
                  keyboardType: TextInputType.phone,
                  controller: phonecontroller,
                  decoration: mescreenfield.copyWith(
                    labelText: 'Phone',
                    hintText: 'number',
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: Color(0xFF262b50),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  style: const TextStyle(
                    color: Color(0xFF262b50),
                  ),
                  controller: jobController,
                  decoration: mescreenfield,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Roundedbutton(
                    text: 'Save',
                    onPressed: () async {
                      //Upload photo to Firebase
                      photo.uploadphoto();
                      _firestore
                          .collection('users')
                          .doc()
                          .set(<String, dynamic>{
                        'address': addresscontroller.text,
                        'fullname': fullnameController.text,
                        'phone': phonecontroller.text,
                        'skill': jobController.text,
                      });
                      setState(() {
                        Navigator.pushNamed(context, 'home');
                      });
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void submitPup(BuildContext context) {
    // First make sure there is some information in the form.
    // A dog needs a name, but may be location independent,
    // so we'll only abandon the save if there's no name.
    if (fullnameController.text.isEmpty) {
    } else {
      // Create a new dog with the information from the form.
      var me = Mesaves(
          address: addresscontroller.text,
          fullname: fullnameController.text,
          job: jobController.text,
          phone: phonecontroller.text);

      // Pop the page off the route stack and pass the new
      // dog back to wherever this page was created.
      Navigator.of(context).pop(const Mesreens());
    }
  }
}
