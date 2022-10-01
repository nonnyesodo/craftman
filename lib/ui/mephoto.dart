import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:craftman/util/photocontroller.dart';

class Mephoto extends StatelessWidget {
  File? pickedfile;
  ImagePicker imagePicker = ImagePicker();
  Photocontroller photocontroller = Get.find();
  final _firebaseStorage = FirebaseStorage.instance;
  Mephoto({
    Key? key,
    this.pickedfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Obx(
          () => CircleAvatar(
              backgroundImage: photocontroller.isProficpicpathset.value == true
                  ? FileImage(File(photocontroller.profilepicpath.value))
                      as ImageProvider
                  : const AssetImage('images/Craftman.png'),
              radius: 80),
        ),
        Positioned(
          bottom: 0,
          child: InkWell(
            child: const Icon(
              Icons.camera,
              color: Color(0xFF9AB4C2),
            ),
            onTap: () {
              showModalBottomSheet(
                backgroundColor: const Color(0xFF9AB4C2),
                context: context,
                builder: (context) => bottomsheet(context),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget bottomsheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.3,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: [
          const Text(
            'choose profile photo',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF262b50),
            ),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (() {
                  takephoto(ImageSource.gallery);
                }),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.image,
                      color: Color(0xFF262b50),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Gallery',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF262b50),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 80.0,
              ),
              InkWell(
                child: Column(
                  children: const [
                    Icon(
                      Icons.camera,
                      color: Color(0xFF262b50),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Camera',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF262b50),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                onTap: () {
                  takephoto(ImageSource.camera);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void takephoto(ImageSource source) async {
    final pickedimage =
        await imagePicker.pickImage(source: source, imageQuality: 100);
    pickedfile = File(pickedimage!.path);
    photocontroller.setprofileimagepath(pickedfile!.path);
    Get.back();
  }

  Future uploadphoto() async {
    if (pickedfile == null) return;
    final fileName = File(pickedfile!.path);
    final destination = 'files/$fileName';

    try {
      final ref = _firebaseStorage.ref(destination).child('file/');
      await ref.putFile(pickedfile!);
    } catch (e) {
      print('error occured');
    }
  }
}
