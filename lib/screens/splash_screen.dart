import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metabox/DataProviders/app_data.dart';
import 'package:metabox/models/explore_item.dart';
import 'package:metabox/models/item_directories.dart';
import 'package:metabox/screens/enroll_screen.dart';
import 'package:metabox/screens/home_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<Offset>? offset;
  Animation<Offset>? textOffset;
  Animation<Offset>? text1Offset;

  void initVars() async {
    // String m = await rootBundle.loadString('assets/data.json');
    // final data = jsonDecode(m);
    // List<ItemDirectories> list = [];
    // for (var data1 in data) {
    //   var item = ItemDirectories.fromMap(data);
    //   list.add(item);
    // }
    // Provider.of<AppData>(context).setItemList(list);
    await Firebase.initializeApp();

    bool isLoggedIn = FirebaseAuth.instance.currentUser != null;

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => isLoggedIn ? HomeScreen() : EnrollScreen()),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 780))
          ..forward();
    controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        initVars();
      }
    });
    textOffset = Tween<Offset>(begin: Offset(0.35, 4.8), end: Offset(0.35, 4.2))
        .animate(CurvedAnimation(
      parent: controller!,
      curve: Curves.easeIn,
    ));
    text1Offset =
        Tween<Offset>(begin: Offset(0.27, 17.0), end: Offset(0.27, 15.0))
            .animate(CurvedAnimation(
      parent: controller!,
      curve: Curves.easeIn,
    ));
    offset = Tween<Offset>(begin: Offset(1.0, 0.4), end: Offset(1, 1.5))
        .animate(CurvedAnimation(
      parent: controller!,
      curve: Curves.easeIn,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/splash.png'),
              fit: BoxFit.cover)),
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,

        children: [
          SlideTransition(
              position: offset!, child: Image.asset('assets/images/logo.png')),
          SizedBox(
            height: 12,
          ),
          SlideTransition(
            position: textOffset!,
            child: Text(
              'MetaBox',
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w700,
                  fontSize: 57,
                  shadows: [
                    Shadow(
                        blurRadius: 4,
                        offset: Offset(0.0, 4.0),
                        color: Color(0xFF000000).withOpacity(0.10))
                  ],
                  color: Color(
                    0xFFF5F5F5,
                  ),
                  decoration: TextDecoration.none),
            ),
          ),
          SlideTransition(
            position: text1Offset!,
            child: Text(
              'Redefining the way you shop',
              style: GoogleFonts.raleway(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFFFFFFF),
                  decoration: TextDecoration.none,
                  shadows: [
                    Shadow(
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        color: Color(0xFF000000).withOpacity(0.25))
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
