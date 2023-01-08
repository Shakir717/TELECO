import '../constants/app_size.dart';
import 'package:flutter/material.dart';
import '../constants/colors_data.dart';

class AppTheme {

  AppTheme._();

  static final instance= AppTheme._();

  ThemeData darkTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      useMaterial3: true,
      /// overall app color
      colorScheme: base.colorScheme.copyWith(
          primary: kNavyBlue,
          onPrimary: kWhite,
          secondary: kNavyBlue,
          error: kRed,
          background: kNavyBlue,
          shadow: kBlack,

      ),

      scaffoldBackgroundColor: kNavyBlue,
      shadowColor: kLightBlue,
      cardColor: kDarkBlue,
      hintColor: kLightBlue,
      errorColor: kRed,
      indicatorColor: kWhite,


      appBarTheme:_appBarTheme(base.appBarTheme) ,

      /// Decorate the inputs
      inputDecorationTheme: _inputDecorationTheme(base),

      /// text themes
      textTheme: _buildTextTheme(base.textTheme),
      textSelectionTheme:  TextSelectionThemeData(
        selectionColor: kWhite,
      ),

      /// Button themes
      textButtonTheme: TextButtonThemeData(style: _textButtonTheme()),
      elevatedButtonTheme: ElevatedButtonThemeData(style: _elevatedButtonTheme()),
      outlinedButtonTheme: OutlinedButtonThemeData(style: _outlineButtonTheme()),

      /// Add the icon themes
      iconTheme: IconThemeData(
        color: kWhite,
        size: Sizes.p24,
        shadows:const [Shadow(color: kBlack)],
      ),

      ///tab bar theme
      tabBarTheme: _tabBarTheme(base),

      /// card theme
      cardTheme: _cardTheme(base),

      /// navigationbar theme
      bottomNavigationBarTheme: _bottomNavigationBarTheme(base)
    );
  }

  /// build appbar theme
  AppBarTheme _appBarTheme(AppBarTheme base){
    return base.copyWith(
      backgroundColor:kNavyBlue,
      titleTextStyle: TextStyle(color: kWhite,fontWeight:FontWeight.bold,fontSize: 18),
      iconTheme: IconThemeData(color: kWhite)
    );
  }

  /// Build Text Theme
  TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      button: base.button!.copyWith(
        color: kWhite,
        fontSize: Sizes.p16,
        fontWeight: FontWeight.w600
      ),
      headline3: base.headline3!.copyWith(
          color: kWhite,
          fontWeight: FontWeight.w800,
          fontSize: Sizes.p24
      ),
      headline4: base.headline4!.copyWith(
          color: kWhite,
          fontWeight: FontWeight.w700,
          fontSize: Sizes.p20
      ),
      headline5: base.headline5!.copyWith(
          color: kWhiteOpacity08,
        fontWeight: FontWeight.w600,
        fontSize: Sizes.p18
      ),
      headline6: base.headline6!.copyWith(
        color: kWhiteOpacity08,
        fontWeight: FontWeight.w600,
        fontSize:Sizes.p16,
      ),
      caption: base.caption!.copyWith(
        color: kWhiteOpacity08,
        fontWeight: FontWeight.w400,
        fontSize:Sizes.p14,
      ),
      bodyText1: base.bodyText1!.copyWith(
        color: kWhite,
        fontWeight: FontWeight.w500,
        fontSize:Sizes.p16,
      ),
    ).apply(
      fontFamily: 'Montserrat',
      displayColor: kWhite,
     bodyColor: kWhite,
    );
  }

  /// Navigation bar theme
 BottomNavigationBarThemeData  _bottomNavigationBarTheme(ThemeData base){
    return base.bottomNavigationBarTheme.copyWith(
      // sets the active color of the `BottomNavigationBar` if `Brightness` is light
    );
  }

  ///Elevated Button Theme
  ButtonStyle _elevatedButtonTheme(){
    return  ElevatedButton.styleFrom(
      primary: kNavyBlue,
      onSurface: kWhite,
      minimumSize: const Size(200, 45),
      padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
      elevation: .5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(Sizes.p4)),
      ),
    ).copyWith(overlayColor:MaterialStateProperty.resolveWith(
            (Set<MaterialState> states){
      if (states.contains(MaterialState.pressed)) {
        return kWhite.withOpacity(.2);
      }
      return null;
    }),
      shadowColor: MaterialStateProperty.all(kDarkBlue)
    );

  }

  /// Text Button Theme
  ButtonStyle _textButtonTheme(){
    return  TextButton.styleFrom(
      animationDuration: const Duration(milliseconds: 500),
      primary: kLightBlue,
      backgroundColor:kWhite,
      minimumSize: const Size(200, 40),
      padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
      elevation:1,
    );

  }

  ///  Outline Button Theme
  ButtonStyle _outlineButtonTheme(){

    return  OutlinedButton.styleFrom(
      animationDuration: const Duration(milliseconds: 500),
      primary: kLightBlue,
      minimumSize: const Size(200, 40),
      padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
      elevation: 1,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(Sizes.p4)),
      ),
    );

  }

  /// TabBar theme
  TabBarTheme _tabBarTheme(ThemeData base){
    return base.tabBarTheme.copyWith(
      labelColor: kNavyBlue,
      unselectedLabelColor: kWhite,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(0), // Creates border
            color: kLightBlue),
        indicatorSize: TabBarIndicatorSize.tab
    );
  }

  /// card theme
  CardTheme _cardTheme(ThemeData base){
    return base.cardTheme.copyWith(
      color: kDarkBlue,
      shadowColor: kDarkBlue,
      elevation: .5,
      shape: RoundedRectangleBorder(
        side: BorderSide(color:kLightBlueOpacity02),
        borderRadius: BorderRadius.circular(Sizes.p12),
      ),
    );
  }

  /// outline border
  OutlineInputBorder _outlineInputBorder({required double radius,required double width,required Color color}){
    return  OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      borderSide: BorderSide(
        width:width,
        color: color,
      ),
    );
  }

  /// input decoration theme
  InputDecorationTheme _inputDecorationTheme(ThemeData base){
    return base.inputDecorationTheme.copyWith(
      border:_outlineInputBorder(radius: Sizes.p4, width: 1, color: kLightBlue),
      enabledBorder:  _outlineInputBorder(radius: Sizes.p4, width: 1, color: kLightBlue),
      focusedBorder:_outlineInputBorder(radius: Sizes.p4, width: 1, color: kLightBlue),
      floatingLabelStyle: const TextStyle(color: kBlack,),
    );
  }
}
