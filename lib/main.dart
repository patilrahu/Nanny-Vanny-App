import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:myapp/constants/color_constant.dart';
import 'package:myapp/feature/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayWidgetBuilder: (progress) {
        return Center(
            child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  color: HexColor(ColorConstant.pinkColor),
                )));
      },
      child: MaterialApp(
          title: 'Nanny Vanny',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: GoogleFonts.alegreyaSans().fontFamily),
          home: const Home()),
    );
  }
}
