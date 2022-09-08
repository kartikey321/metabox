import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:metabox/DataProviders/app_data.dart';
import 'package:metabox/screens/dashboard.dart';
import 'package:metabox/screens/profile.dart';
import 'package:metabox/screens/virtual_shops.dart';
import 'package:metabox/utils/constants.dart';
import 'package:metabox/utils/contract_linking.dart';
import 'package:provider/provider.dart';
import 'package:web3dart/web3dart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Client? httpClient;
  Web3Client? ethClient;
  int _selectedIndex = 0;
  List<Widget> _widgets = [Dashboard(), Profile()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _selectedIndex =
        Provider.of<AppData>(context, listen: false).selectedTab ?? 0;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: -190,
                    child: _widgets.elementAt(_selectedIndex)),
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
                    child: GestureDetector(
                        onTap: () async {
                          await LaunchApp.openApp(
                              androidPackageName:
                                  'com.DefaultCompany.MetaBoxARStore',
                              openStore: false);
                        },
                        child: Image.asset('assets/images/shop.png')))
              ],
            ),
          ),
        ],
      )),
    );
  }
}
