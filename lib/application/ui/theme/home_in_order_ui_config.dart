import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/theme/text_styles.dart';

class HomeInOrderUiConfig {
  HomeInOrderUiConfig._();

  static String get title => 'Home in Order';

  static ThemeData get theme => ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: TextStyles.title,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.lightBlue[800],
        fontFamily: 'Urbanist',
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      );
}
