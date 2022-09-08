import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metabox/DataProviders/app_data.dart';
import 'package:metabox/Helpers/auth_helper.dart';
import 'package:metabox/models/explore_item.dart';
import 'package:metabox/data/items.dart';
import 'package:metabox/models/item_directories.dart';
import 'package:metabox/screens/product_screen.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int? _selectedItem = 0;
  ScrollController? _scrollController;
  List<ItemDirectories>? itemList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController = ScrollController();
    _scrollController!.addListener(_scrollListener);
  }

  _scrollListener() {
    setState(() {
      _selectedItem = (_scrollController!.offset / 190).round();
      _selectedItem == 0 ? 0 : _selectedItem! - 1;
      print(_selectedItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    itemList = Provider.of<AppData>(context, listen: false).itemList;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                getHeader(),
                SizedBox(
                  height: 12,
                ),
                Container(
                  width: double.maxFinite,
                  height: 178,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      image: DecorationImage(
                          image: AssetImage('assets/images/home.png'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: 19,
                ),
                Text(
                  'Explore',
                  style: GoogleFonts.montserrat(
                      color: Color(0xFF454545),
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 19,
                ),
                Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ExploreItem(
                          imagePath: 'assets/images/tv2.png',
                          text: 'Electronics',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => ProductScreen(
                                          itemType: 'electronics',
                                        ))));
                          },
                        ),
                        ExploreItem(
                          imagePath: 'assets/images/watch.png',
                          text: 'Watches',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => ProductScreen(
                                          itemType: 'watches',
                                        ))));
                          },
                        ),
                        ExploreItem(
                          imagePath: 'assets/images/iphone13.png',
                          text: 'Phones',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => ProductScreen(
                                          itemType: 'watches',
                                        ))));
                          },
                        ),
                        ExploreItem(
                          imagePath: 'assets/images/jwellery.png',
                          text: 'Jwellery',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => ProductScreen(
                                          itemType: 'jewellery',
                                        ))));
                          },
                        ),
                        ExploreItem(
                          text: 'Shoes',
                          imagePath: 'assets/images/shoes.png',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => ProductScreen(
                                          itemType: 'shoes',
                                        ))));
                          },
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Experience before you buy',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Color(0xFF454545)),
                ),
                SizedBox(
                  height: 250,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ListView.custom(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          childrenDelegate:
                              SliverChildBuilderDelegate((context, index) {
                            bool selected = (index == _selectedItem);
                            return Container(
                              height: 230,
                              child: Center(
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 250,
                                      margin: EdgeInsets.only(
                                        top: 12,
                                      ),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            AnimatedContainer(
                                              duration:
                                                  Duration(milliseconds: 500),
                                              height: selected ? 0 : 20,
                                              width: selected ? 170 : 150,
                                            ),
                                            AnimatedContainer(
                                              duration:
                                                  Duration(milliseconds: 500),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 15),
                                              width: selected ? 170 : 150,
                                              height: selected ? 219 : 190,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius:
                                                            selected ? 10 : 4,
                                                        offset: Offset(0, 4),
                                                        color: Color(0xFF000000)
                                                            .withOpacity(0.25))
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  color: selected
                                                      ? Color(0xFFFA6689)
                                                      : Color(0xFFE29BF5)),
                                              child: Stack(
                                                children: [
                                                  Positioned(
                                                    top: selected ? 25 : 5,
                                                    right: 0,
                                                    left: 0,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(4),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Image.asset(
                                                            expItems[index].url,
                                                            height: 130,
                                                            width: 98,
                                                          ),
                                                          Container(
                                                            child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Text(
                                                                    expItems[
                                                                            index]
                                                                        .name,
                                                                    style: GoogleFonts.montserrat(
                                                                        fontSize:
                                                                            17,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  Text(
                                                                    '',
                                                                    style: GoogleFonts.montserrat(
                                                                        fontSize:
                                                                            17,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ]),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: -5,
                                      right: -6,
                                      child: Container(
                                        margin:
                                            EdgeInsets.only(right: 10, top: 10),
                                        child: GestureDetector(
                                          onTap: () async {
                                            await LaunchApp.openApp(
                                                androidPackageName:
                                                    expItems[index]
                                                        .packageName);
                                          },
                                          child: AnimatedContainer(

                                              //curve: Curves.bounceInOut,
                                              duration:
                                                  Duration(milliseconds: 500),
                                              height: !selected ? 0 : 38,
                                              width: !selected ? 0 : 95,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8, vertical: 6),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFA16EFF),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                              child: Text(
                                                'Try me!',
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white),
                                              )),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }, childCount: expItems.length),
                        ),
                        SizedBox(
                          width: 200,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 250,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getHeader() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Hi Kartikey',
                  style: GoogleFonts.montserrat(
                      color: Color(0xFF454545),
                      fontWeight: FontWeight.w700,
                      fontSize: 28),
                ),
                SizedBox(
                    width: 48,
                    height: 48,
                    child: Image.asset('assets/images/hi.png'))
              ],
            ),
          ),
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/face.png'),
          )
        ],
      ),
    );
  }
}

class ExploreItem extends StatelessWidget {
  const ExploreItem(
      {Key? key,
      required this.imagePath,
      required this.onPressed,
      required this.text})
      : super(key: key);

  final String imagePath;
  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 11),
            height: 90,
            width: 90,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                ),
                borderRadius: BorderRadius.circular(45),
                gradient: RadialGradient(
                    colors: [Color(0xFF8746FF), Color(0xFFD8ACCB)])),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            text,
            style: GoogleFonts.montserrat(
                color: Color(0xFF515151),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

/* 
ListView.builder(
                    controller: _scrollController,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      bool selected = (index == _selectedItem);
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        constraints: BoxConstraints(
                          maxWidth: selected ? 170 : 150,
                          maxHeight: selected ? 150 : 100,
                        ),
                        width: selected ? 170 : 150,
                        height: selected ? 150 : 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: selected
                                ? Color(0xFFFA6689)
                                : Color(0xFFE29BF5)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(items[index]['imagePath']),
                            Container(
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(items[index]['text']),
                                    Text(items[index]['subtitle']),
                                  ]),
                            )
                          ],
                        ),
                      );
                    }),
*/
