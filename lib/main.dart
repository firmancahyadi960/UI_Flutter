import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_apps/color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: Image.asset(
              'assets/images/busur.png',
              width: 266,
              height: 200,
            ),
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Upgrade to',
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  color: white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                'Pro',
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  color: blue,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Go unlock all features and \n build your own business bigger',
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: grey,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 50,
          ),
        ],
      );
    }

    Widget options(int index, String title, String subtitle, String price) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: selectedIndex == index
                  ? Color(0xFF007DFF)
                  : Color(0xFF8997B8),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  selectedIndex == index
                      ? Image.asset(
                          'assets/images/checkblue.png',
                          width: 18,
                        )
                      : Image.asset(
                          'assets/images/check.png',
                          width: 18,
                        ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: white,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 91,
                  ),
                  Text(
                    price,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget button() {
      return Column(
        children: [
          Container(
            width: 350,
            height: 51,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(71),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Checkout Now',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: background,
        body: SingleChildScrollView(
          child: Column(
            children: [
              header(),
              options(0, 'Monthly', 'Good for starting up', '\$20'),
              options(1, 'Quarterly', 'Focusing on building', '\$55'),
              options(2, 'Yearly', 'Steady company', '\$220'),
              SizedBox(
                height: 20,
              ),
              selectedIndex == -1 ? SizedBox() : button(),
            ],
          ),
        ),
      ),
    );
  }
}
