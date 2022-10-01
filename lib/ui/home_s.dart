import 'package:craftman/util/c_icon.dart';
import 'package:craftman/util/icon_b.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../icon_screen/ac.dart';
import '../icon_screen/carmechanic.dart';
import '../icon_screen/carpenter.dart';
import '../icon_screen/cctv.dart';
import '../icon_screen/electrician.dart';
import '../icon_screen/generator.dart';
import '../icon_screen/houseagent.dart';
import '../icon_screen/painter.dart';
import '../icon_screen/plumber.dart';
import '../icon_screen/refrigerator.dart';
import '../icon_screen/satellites.dart';
import '../icon_screen/solar.dart';
import '../icon_screen/tyler.dart';
import '../icon_screen/walpaper.dart';
import '../icon_screen/windowb.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Craftman'),
        centerTitle: true,
        backgroundColor: const Color(0xFF9AB4C2),
      ),
      //sidebar
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFe45a15),
              ),
              child: Text(
                'Craftman',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
            //sidebar logout button
            ListTile(
              title: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFe45a15),
                ),
                onPressed: () async {
                  _auth.signOut();
                  Navigator.pushNamed(context, 'Welcome');
                },
                child: const Text(
                  'logout',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                alignment: Alignment.center,
                children: const [
                  //top home image
                  CircleAvatar(
                    backgroundImage: AssetImage('images/Craftman.png'),
                    radius: 80,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: Row(
                  children: [
                    //refridgerator button
                    Iconbutton(
                      text: 'Refrigerator Repair',
                      iconb: const Icon(MyFlutterApp.nounrefrigerator10740),
                      colour: const Color(0xFFe45a15),
                      onpressed: () {
                        nextpage(const Refrigerator());
                      },
                    ),
                    //generator button
                    Iconbutton(
                        text: 'Generator Repair',
                        iconb: const Icon(MyFlutterApp.noungenerator2453838),
                        colour: const Color(0xFF262b50),
                        onpressed: () {
                          nextpage(const Generator());
                        }),
                    Iconbutton(
                        text: 'Car Mechanic',
                        iconb: const Icon(Icons.car_repair),
                        colour: const Color(0xFF9AB4C2),
                        onpressed: () {
                          nextpage(const Carm());
                        }),
                  ],
                ),
              ),
              Row(
                children: [
                  Iconbutton(
                      text: 'Window Blind',
                      iconb: const Icon(MyFlutterApp.windowsvgrepocom1),
                      colour: const Color(0xFF9AB4C2),
                      onpressed: () {
                        nextpage(const Windowb());
                      }),
                  Iconbutton(
                      text: 'Tyler',
                      iconb: const Icon(MyFlutterApp.coursetilesortsvgrepocom),
                      colour: const Color(0xFFe45a15),
                      onpressed: () {
                        nextpage(const Tyler());
                      }),
                  Iconbutton(
                      text: 'Electrician',
                      iconb: const Icon(MyFlutterApp.electriciansvgrepocom),
                      colour: const Color(0xFF262b50),
                      onpressed: () {
                        nextpage(const Electric());
                      }),
                ],
              ),
              Row(
                children: [
                  Iconbutton(
                      text: 'Carpenter',
                      iconb: const Icon(MyFlutterApp.carpentersvgrepocom1),
                      colour: const Color(0xFFe45a15),
                      onpressed: () {
                        nextpage(const Carpenter());
                      }),
                  Iconbutton(
                      text: 'Plumber',
                      iconb: const Icon(
                          MyFlutterApp.plumberingwatersupplysvgrepocom),
                      colour: const Color(0xFF262b50),
                      onpressed: () {
                        nextpage(const Plumber());
                      }),
                  Iconbutton(
                      text: 'Satellite',
                      iconb:
                          const Icon(MyFlutterApp.satellitedishradarsvgrepocom),
                      colour: const Color(0xFF9AB4C2),
                      onpressed: () {
                        nextpage(const Sattelite());
                      }),
                ],
              ),
              Row(
                children: [
                  Iconbutton(
                      text: 'Air condition',
                      iconb: const Icon(MyFlutterApp.airconditionersvgrepocom2),
                      colour: const Color(0xFF262b50),
                      onpressed: () {
                        nextpage(const Ac());
                      }),
                  Iconbutton(
                      text: 'CCTV',
                      iconb: const Icon(
                          MyFlutterApp.surveillancecamerasvgrepocom1),
                      colour: const Color(0xFF9AB4C2),
                      onpressed: () {
                        nextpage(const Cctv());
                      }),
                  Iconbutton(
                      text: 'Solar',
                      iconb: const Icon(MyFlutterApp.nounsolar4257586),
                      colour: const Color(0xFFe45a15),
                      onpressed: () {
                        nextpage(const Solar());
                      }),
                ],
              ),
              Row(
                children: [
                  Iconbutton(
                      text: 'Wallpaper',
                      iconb: const Icon(MyFlutterApp.nounwallpaper578982),
                      colour: const Color(0xFF9AB4C2),
                      onpressed: () {
                        nextpage(const Wallpaper());
                      }),
                  Iconbutton(
                      text: 'House Agent',
                      iconb: const Icon(MyFlutterApp.apartmentsvgrepocom1),
                      colour: const Color(0xFFe45a15),
                      onpressed: () {
                        nextpage(const House());
                      }),
                  Iconbutton(
                      text: 'Painter',
                      iconb: const Icon(MyFlutterApp.paintersvgrepocom),
                      colour: const Color(0xFF262b50),
                      onpressed: () {
                        nextpage(const Painter());
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void nextpage(page) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return page;
      },
    ));
  }
}
