import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craftman/util/displaybub.dart';
import 'package:flutter/material.dart';

class Cctv extends StatefulWidget {
  const Cctv({Key? key}) : super(key: key);

  @override
  CctvState createState() => CctvState();
}

class CctvState extends State<Cctv> {
  String address = "";
  List<Map<String, dynamic>> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9AB4C2),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Card(
          child: TextField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'Search address'),
            onChanged: (val) {
              setState(() {
                address = val;
              });
            },
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('cctv').snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data!.docs[index].data()
                        as Map<String, dynamic>;

                    if (address.isEmpty) {
                      return Displaybub(
                        fullname: (data['fullname']),
                        address: (data['address']),
                        phone: (data['phone']),
                        job: (data['job']),
                      );
                    }
                    if (data['address']
                        .toString()
                        .toLowerCase()
                        .startsWith(address.toLowerCase())) {
                      return Displaybub(
                        fullname: (data['fullname']),
                        address: (data['address']),
                        phone: (data['phone']),
                        job: (data['job']),
                      );
                    }
                    return Container();
                  },
                );
        },
      ),
    );
  }
}
