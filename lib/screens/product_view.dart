import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metabox/DataProviders/app_data.dart';
import 'package:metabox/data/items.dart';
import 'package:metabox/models/explore_item.dart';
import 'package:metabox/screens/home_screen.dart';
import 'package:metabox/widgets/buy_option_dialog.dart';
import 'package:provider/provider.dart';
import 'package:pay/pay.dart';

const _paymentItems = [
  PaymentItem(
    label: 'Total',
    amount: '99.99',
    status: PaymentItemStatus.final_price,
  )
];

class ProductView extends StatefulWidget {
  const ProductView({Key? key, required this.item}) : super(key: key);
  final ExploreItemModel item;

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: -190,
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
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset('assets/images/back.png')),
                        const CircleAvatar(
                          backgroundColor: Color(0xFFF9F8FC),
                          radius: 18,
                          backgroundImage: AssetImage('assets/images/cart.png'),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      width: 0.72 * width,
                      height: 0.8 * width,
                      decoration: BoxDecoration(
                          gradient: RadialGradient(colors: [
                        Color(0xFFA16EFF),
                        Color(0xFFD9D9D9).withOpacity(0)
                      ])),
                      child: Stack(children: [
                        Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              widget.item.url,
                            )),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MaterialButton(
                                  onPressed: () async {
                                    await LaunchApp.openApp(
                                        androidPackageName:
                                            widget.item.packageName);
                                  },
                                  child: Container(
                                    height: 38,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(0, 4),
                                              blurRadius: 4,
                                              color: Color(0xFF000000)
                                                  .withOpacity(0.25))
                                        ],
                                        color: Color(0xFFA16EFF),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                        child: Text('Try Me',
                                            style: GoogleFonts.montserrat(
                                                fontSize: 17,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500))),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 35, vertical: 9),
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {},
                                  child: Container(
                                    height: 38,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFFF7091)),
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(0, 4),
                                              blurRadius: 4,
                                              color: Color(0xFF000000)
                                                  .withOpacity(0.25))
                                        ],
                                        color: Color(0xFFffffff),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                        child: Text('Visit Store',
                                            style: GoogleFonts.montserrat(
                                                fontSize: 17,
                                                color: Color(0xFFFF7091),
                                                fontWeight: FontWeight.w500))),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 35, vertical: 9),
                                  ),
                                )
                              ],
                            ))
                      ]),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Text(widget.item.name,
                        style: GoogleFonts.montserrat(
                            fontSize: 25, fontWeight: FontWeight.w600)),
                    Text(
                      '\u{20B9}15,000',
                      style: GoogleFonts.montserrat(
                          color: Color(0xFF2F2F2F),
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                      textAlign: TextAlign.start,
                    ),
                    RatingStars(
                      valueLabelVisibility: false,
                      value: 4,
                      starSize: 30,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    MaterialButton(
                        onPressed: () {
                          showDialog(
                              barrierDismissible: true,
                              context: context,
                              builder: (BuildContext context) => BuyOption());
                        },
                        child: Container(
                          height: 57,
                          width: 290,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xFF00C1A2)),
                          child: Center(
                            child: Text('BUY',
                                style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 28,
                                )),
                          ),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Customer Reviews',
                      style: GoogleFonts.montserrat(
                          color: Color(0xFF2F2F2F),
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFF2F2F2F)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  AssetImage('assets/images/profile_pic.png'),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Jhon doe',
                                      style: GoogleFonts.raleway(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      child: RatingStars(value: 4.0),
                                    )
                                  ],
                                ),
                                Container(
                                  width: 300,
                                  child: Text(
                                    'Lorem ipsum dolor sit amet, consectetu adipiscing elit, sed do.',
                                    style: GoogleFonts.roboto(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ))
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 80.0,
                width: double.maxFinite,
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                    color: Color(0xFFA16EFF),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 0.1 * width),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            Provider.of<AppData>(context, listen: false)
                                .setSelectedTab(0);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => HomeScreen())));
                          });
                        },
                        child: Column(
                          children: [
                            const Expanded(
                                child: Icon(
                              Icons.dashboard,
                              color: Colors.white,
                            )),
                            Provider.of<AppData>(context, listen: false)
                                        .selectedTab ==
                                    0
                                ? const Text(
                                    'Dashboard',
                                    style: TextStyle(color: Colors.white),
                                  )
                                : const SizedBox()
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            Provider.of<AppData>(context, listen: false)
                                .setSelectedTab(1);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => HomeScreen())));
                          });
                        },
                        child: Column(
                          children: [
                            const Expanded(
                                child: Icon(
                              Icons.person,
                              color: Colors.white,
                            )),
                            Provider.of<AppData>(context, listen: false)
                                        .selectedTab ==
                                    1
                                ? const Text(
                                    'Profile',
                                    style: TextStyle(color: Colors.white),
                                  )
                                : const SizedBox()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          Positioned(
              bottom: 18,
              left: width / 2 - 50,
              child: Image.asset('assets/images/shop.png'))
        ],
      )),
    );
  }

  void onGooglePayResult(paymentResult) {
    print(paymentResult);
  }
}
