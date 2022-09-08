import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              Text(
                'Virtual Shops',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    color: Color(0xFF000000)),
              ),
              SizedBox(
                height: 22,
              ),
              Text('Experience the world of virtual shops',
                  style: GoogleFonts.montserrat(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF515151)))
            ],
          ),
        ),
      ),
    );
  }
}
