import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metabox/data/items.dart';
import 'package:metabox/models/explore_item.dart';
import 'package:metabox/screens/home_screen.dart';
import 'package:metabox/screens/product_view.dart';
import 'package:provider/provider.dart';

import '../DataProviders/app_data.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({Key? key, required this.itemType}) : super(key: key);

  String itemType;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ScrollController? _scrollController;
  int _selectedItem = 0;
  List<ExploreItemModel>? items;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController!.addListener(_scrollListener);

    switch (widget.itemType) {
      case 'watches':
        items = watches;
        break;
      case 'fridge':
        items = fridges;
        break;
      case 'jewellery':
        items = jwellery;
        break;
      case 'shoes':
        items = shoes;
        break;

      case 'electronics':
        items = electronics;
        break;
    }
  }

  _scrollListener() {
    setState(() {
      _selectedItem = (_scrollController!.offset / 290).round();
      _selectedItem == 0 ? 0 : _selectedItem - 1;
      print(_selectedItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.itemType[0].toUpperCase() +
                                widget.itemType.substring(1),
                            style: GoogleFonts.montserrat(
                                color: Color(0xFF484848),
                                fontWeight: FontWeight.w600,
                                fontSize: 32),
                          ),
                          const CircleAvatar(
                            backgroundColor: Color(0xFFF9F8FC),
                            radius: 18,
                            backgroundImage:
                                AssetImage('assets/images/cart.png'),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 395,
                        child: ListView.custom(
                          controller: _scrollController,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          childrenDelegate:
                              SliverChildBuilderDelegate((context, index) {
                            bool selected = (index == _selectedItem);
                            return Container(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => ProductView(
                                              item: items![index]))));
                                },
                                child: Container(
                                  height: 395,
                                  child: Center(
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 395,
                                          margin: EdgeInsets.only(
                                            top: 12,
                                          ),
                                          child: Center(
                                            child: Column(
                                              children: [
                                                AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  height: selected ? 0 : 30,
                                                  width: selected ? 170 : 150,
                                                ),
                                                AnimatedContainer(
                                                  padding: EdgeInsets.all(15.0),
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 15),
                                                  width: selected ? 274 : 227,
                                                  height: selected ? 371 : 285,
                                                  decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                            blurRadius: selected
                                                                ? 10
                                                                : 4,
                                                            offset:
                                                                Offset(0, 4),
                                                            color: Color(
                                                                    0xFF000000)
                                                                .withOpacity(
                                                                    0.25))
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18),
                                                      color: selected
                                                          ? Color(0xFFFA6689)
                                                          : Color(0xFFE29BF5)),
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        top: selected ? 15 : 5,
                                                        right: 0,
                                                        left: 0,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .stretch,
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      12),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  AnimatedContainer(
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            500),
                                                                    child: Icon(
                                                                      Icons
                                                                          .shopping_cart,
                                                                      color: Colors
                                                                          .white,
                                                                      size: selected
                                                                          ? 32
                                                                          : 0,
                                                                    ),
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap:
                                                                        () async {
                                                                      await LaunchApp.openApp(
                                                                          androidPackageName:
                                                                              items![index].packageName);
                                                                    },
                                                                    child: AnimatedContainer(

                                                                        //curve: Curves.bounceInOut,
                                                                        duration: Duration(milliseconds: 500),
                                                                        height: !selected ? 0 : 38,
                                                                        width: !selected ? 0 : 95,
                                                                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                                                                        decoration: BoxDecoration(color: Color(0xFFA16EFF), borderRadius: BorderRadius.circular(20.0)),
                                                                        child: Text(
                                                                          'Try me!',
                                                                          style: GoogleFonts.montserrat(
                                                                              fontSize: 20,
                                                                              fontWeight: FontWeight.w500,
                                                                              color: Colors.white),
                                                                        )),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            AnimatedContainer(
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      500),
                                                              height: selected
                                                                  ? 249
                                                                  : 168,
                                                              width: selected
                                                                  ? 240
                                                                  : 135,
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          items![index]
                                                                              .url)),
                                                                  gradient:
                                                                      RadialGradient(
                                                                          colors: [
                                                                        Color(
                                                                            0xFF5359FD),
                                                                        Color(0xFFFF552F)
                                                                            .withOpacity(0)
                                                                      ])),
                                                            ),
                                                            Container(
                                                              child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Text(
                                                                      items![index]
                                                                          .name,
                                                                      style: GoogleFonts.montserrat(
                                                                          fontSize:
                                                                              17,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          color:
                                                                              Colors.white),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                    ),
                                                                    Text(
                                                                      items![index]
                                                                              .description ??
                                                                          '',
                                                                      style: GoogleFonts.montserrat(
                                                                          fontSize:
                                                                              17,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ]),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }, childCount: items!.length),
                        ),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      Text(
                        'Largest, most advanced display yet. Feel the world in your wrist',
                        style: GoogleFonts.montserrat(
                            color: Color(0xFF494949),
                            fontSize: 17.5,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        '\u{20B9}15,000',
                        style: GoogleFonts.montserrat(
                            color: Color(0xFF2F2F2F),
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                        textAlign: TextAlign.start,
                      )
                    ]),
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
}
