import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metabox/Helpers/auth_helper.dart';

enum Tabs { login, signup }

class EnrollScreen extends StatefulWidget {
  const EnrollScreen({Key? key}) : super(key: key);

  @override
  State<EnrollScreen> createState() => _EnrollScreenState();
}

class _EnrollScreenState extends State<EnrollScreen>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  Tabs _selectedTab = Tabs.login;
  int containerWidth = 0;

  //login page controllers
  final TextEditingController email_login_controller = TextEditingController();
  final TextEditingController pass_login_controller = TextEditingController();

  //signup page controllers
  final TextEditingController name_controller = TextEditingController();
  final TextEditingController email_signup_controller = TextEditingController();
  final TextEditingController pass_signup_controller = TextEditingController();
  final TextEditingController confirm_pass_controller = TextEditingController();

  List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    AuthHelper.walletConn();
    _controller = TabController(length: 2, vsync: this);
    _controller!.addListener(() {
      setState(() {
        _selectedTab = Tabs.values[_controller!.index];
        containerWidth = _selectedTab == Tabs.login ? 300 : 472;
      });
    });
    for (var node in _focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    for (var node in _focusNodes) {
      node.removeListener(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 0.36 * height,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16)),
                    image: DecorationImage(
                        image: AssetImage('assets/images/enroll.png'),
                        fit: BoxFit.cover),
                  ),
                )),
            Positioned(
                left: 45,
                right: 45,
                top: 0.287 * height,
                child: AnimatedSize(
                  duration: Duration(milliseconds: 800),
                  curve: Curves.linear,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 0.01 * width),
                    height: _selectedTab == Tabs.login ? 300 : 425,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 19,
                              spreadRadius: 4,
                              offset: Offset(3, 9),
                              color: Color(0xFFADA9A9).withOpacity(0.25))
                        ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 50,
                          child: TabBar(
                              labelStyle: GoogleFonts.montserrat(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              indicatorSize: TabBarIndicatorSize.label,
                              indicatorColor: Color(0xFFA16EFF),
                              labelColor: Color(0xFF5A5A5A),
                              unselectedLabelColor: Color(0xFFB8B8B8),
                              controller: _controller,
                              tabs: [
                                Tab(
                                  text: 'Login',
                                ),
                                Tab(
                                  text: 'Signup',
                                )
                              ]),
                        ),
                        Expanded(
                          child: TabBarView(
                              controller: _controller,
                              children: [getLoginForm(), getSignupForm()]),
                        ),
                      ],
                    ),
                  ),
                )),
            Positioned(
                top: _selectedTab == Tabs.login
                    ? 0.287 * height + 275
                    : 0.7645 * height,
                left: width / 2 - ((0.48 * width) / 2) - 20,
                child: MaterialButton(
                  onPressed: () {
                    if (_selectedTab == Tabs.login) {
                      AuthHelper.login(email_login_controller.text,
                          pass_login_controller.text, context);
                    } else {
                      AuthHelper.registerUser(
                          email_signup_controller.text,
                          pass_signup_controller.text,
                          context,
                          name_controller.text,
                          7252926670);
                    }
                  },
                  child: Container(
                    height: 55,
                    width: 0.48 * width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/button_bg.png'),
                            fit: BoxFit.cover)),
                    child: Center(
                        child: Text(
                      'Lets go!!',
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: Colors.white),
                    )),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget getSignupForm() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomInputText(
                focusNode: _focusNodes[3],
                controller: name_controller,
                label: 'Name',
                icon: Icons.person,
              ),
              CustomInputText(
                focusNode: _focusNodes[4],
                controller: email_signup_controller,
                label: 'Email',
                icon: Icons.person,
              ),
              CustomInputText(
                obscureText: true,
                focusNode: _focusNodes[5],
                controller: pass_signup_controller,
                label: 'Password',
                icon: Icons.key,
              ),
              CustomInputText(
                obscureText: true,
                focusNode: _focusNodes[6],
                controller: confirm_pass_controller,
                label: 'Confirm Password',
                icon: Icons.key,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget getLoginForm() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Stack(
        children: [
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomInputText(
                  focusNode: _focusNodes[0],
                  controller: email_login_controller,
                  label: 'Email',
                  icon: Icons.person,
                ),
                CustomInputText(
                  obscureText: true,
                  focusNode: _focusNodes[1],
                  controller: pass_login_controller,
                  label: 'Password',
                  icon: Icons.key,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomInputText extends StatelessWidget {
  const CustomInputText(
      {Key? key,
      required FocusNode focusNode,
      required this.controller,
      required this.label,
      this.obscureText = false,
      required this.icon})
      : _focusNode = focusNode,
        super(key: key);

  final FocusNode _focusNode;
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextField(
          focusNode: _focusNode,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            label: Text(label),
            prefixIconColor:
                _focusNode.hasFocus ? Colors.black87 : Color(0xFFDAD6D6),
            labelStyle: TextStyle(
                color:
                    _focusNode.hasFocus ? Colors.black87 : Color(0xFFB3B3B3)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
            prefixIcon: Icon(icon,
                color:
                    _focusNode.hasFocus ? Colors.black87 : Color(0xFFDAD6D6)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.0),
                borderSide: BorderSide(
                  color: Colors.black87,
                )),
          )),
    );
  }
}
