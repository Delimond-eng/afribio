import 'package:afriweb/models/appdata_model.dart';
import 'package:afriweb/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> AppDataModel(),
      child: MaterialApp(
        title: 'afribio by rt group',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.green,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        ),

        home: HomePage(),
      ),
    );
  }
}

