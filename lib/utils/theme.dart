import 'package:flutter/material.dart';
import '/utils/utils.dart';

class AppTheme {
  // Customize ThemeData Accodting to need
  static final InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
    filled: true,
    errorMaxLines: 2,
    fillColor: kColtextInputFillColor,
    labelStyle: const TextStyle(
      color: kColprimaryColorLight,
    ),
    border: OutlineInputBorder(
      borderRadius: kADborderRadiusCircular,
      borderSide: BorderSide.none,
    ),
  );

  static final SnackBarThemeData _snacBarThemeData = SnackBarThemeData(
    backgroundColor: kColtextColor,
    behavior: SnackBarBehavior.floating,
    actionTextColor: kColprimaryColorLight,
    elevation: 20,
    shape: RoundedRectangleBorder(
      borderRadius: kADborderRadiusCircular,
    ),
    contentTextStyle: const TextStyle(),
  );

  static final CheckboxThemeData _checkboxThemeData = CheckboxThemeData(
    fillColor: MaterialStateProperty.all(kColprimaryColorLight),
  );

  static final TabBarTheme _tabBarTheme = TabBarTheme(
    labelColor: kColprimaryColorLight,
    labelStyle: const TextStyle(
      fontSize: 16,
    ),
    indicator: BoxDecoration(
      border: Border.all(
        color: kColprimaryColorLight,
      ),
      borderRadius: kADborderRadiusCircular * 4,
    ),
  );

  static const AppBarTheme _appBarTheme = AppBarTheme(
    color: kColprimaryColorLight,
  );

  static final ListTileThemeData _listTileTheme = ListTileThemeData(
    minVerticalPadding: 4,
    style: ListTileStyle.drawer,
    dense: false,
    visualDensity: VisualDensity.comfortable,
    horizontalTitleGap: 18,
    contentPadding: kADmarginAll,
    tileColor: kColtextInputFillColor,
    shape: RoundedRectangleBorder(
      borderRadius: kADborderRadiusCircular,
      side: BorderSide.none,
    ),
    enableFeedback: true,
  );

  static final SwitchThemeData _switchTheme = SwitchThemeData(
    splashRadius: 18,
    thumbColor: MaterialStateProperty.all(kColprimaryColorLight),
    trackColor: MaterialStateProperty.all(
      kColprimaryColorLight.withOpacity(.1),
    ),
  );
  static const _bottomSheetTheme = BottomSheetThemeData(
    clipBehavior: Clip.hardEdge,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(28),
      ),
    ),
  );

  static const _floatingActionButtonTheme = FloatingActionButtonThemeData(
    backgroundColor: kColprimaryColorLight,
  );

  /// getter
  static get lightTheme => _lightTheme();
  static get darkTheme => _lightTheme();

  /// private function which returns themes
  /// here i have used light only add if needed
  static ThemeData _lightTheme() => ThemeData(
        primaryColor: kColprimaryColorLight,
        inputDecorationTheme: _inputDecorationTheme,
        snackBarTheme: _snacBarThemeData,
        checkboxTheme: _checkboxThemeData,
        tabBarTheme: _tabBarTheme,
        appBarTheme: _appBarTheme,
        listTileTheme: _listTileTheme,
        switchTheme: _switchTheme,
        bottomSheetTheme: _bottomSheetTheme,
        floatingActionButtonTheme: _floatingActionButtonTheme,
      );
}
