import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:metabox/utils/constants.dart';
import 'package:metabox/utils/contract_linking.dart';
import 'package:web3dart/web3dart.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Client? httpClient;
  Web3Client? ethClient;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/back.png'),
                      Text(
                        'Profile',
                        style: GoogleFonts.montserrat(
                            color: Color(0xFF2F2F2F),
                            fontWeight: FontWeight.w600,
                            fontSize: 32),
                      ),
                      const CircleAvatar(
                        backgroundColor: Color(0xFFF9F8FC),
                        radius: 18,
                        backgroundImage: AssetImage('assets/images/cart.png'),
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xFF000000).withOpacity(0.25),
                                  offset: Offset(4, 4),
                                  blurRadius: 34,
                                  spreadRadius: -2)
                            ]),
                        padding: const EdgeInsets.all(24),
                        margin: EdgeInsets.only(
                            top: 0.34 * height, left: 23, right: 23),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(
                                  height: 45,
                                ),
                                ProfileWidget(
                                  attr: 'Name',
                                  val: 'kartikeymahawar1234@gmail.com',
                                ),
                                ProfileWidget(
                                    attr: 'Phone Number', val: '7252926670'),
                                ProfileWidget(
                                    attr: 'Delivery Address',
                                    val:
                                        'Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 60,
                        left: 23,
                        child: Container(
                          padding: EdgeInsets.all(25),
                          width: 0.82 * width,
                          decoration: BoxDecoration(
                            color: Color(0xFFA16EFF),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 65,
                                backgroundImage:
                                    AssetImage('assets/images/profile_pic.png'),
                              ),
                              SizedBox(
                                height: 28,
                              ),
                              Text('Kartikey Mahawar',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(),
                              Text('Customer',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  ProfileWidget({
    required this.attr,
    required this.val,
    Key? key,
  }) : super(key: key);
  String attr;
  String val;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(
          attr,
          style: GoogleFonts.montserrat(
              color: Color(0xFFFF7091),
              fontSize: 16,
              fontWeight: FontWeight.w500),
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 11,
        ),
        Text(
          val,
          style: GoogleFonts.montserrat(
              color: Color(0xFF0E0E0E),
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          child: Divider(color: Colors.grey),
        )
      ]),
    );
  }
}
