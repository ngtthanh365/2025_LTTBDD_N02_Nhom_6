import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi'),
  ];
  /// **'Home'**
  String get titleHome;
  /// **'10-Day Forecast'**
  String get titleForecast;

  /// **'Settings'**
  String get titleSettings;

  /// **'Team Information'**
  String get teamInfo;

  /// **'Language'**
  String get language;

  /// **'My Location'**
  String get myLocation;

  /// **'GROUP 6 - MOBILE PROGRAMMING'**
  String get groupHeader;

  /// **'Member'**
  String get memberRole;

  /// **'Phenikaa University\n© 2025 - Group 6'**
  String get footer;

  /// **'Student ID'**
  String get mssvLabel;

  /// **'Class'**
  String get classLabel;

  /// **'Email'**
  String get emailLabel;

  /// **'Weather Forecast'**
  String get splashLine1;

  /// **'Weather'**
  String get splashLine2;

  /// **'Get Started'**
  String get start;

  /// **'Skip'**
  String get skip;

  /// **'Hourly Forecast'**
  String get intro1Title;

  /// **'Get deep weather insights.\nUpdated hourly.'**
  String get intro1Desc;

  /// **'Real-time Weather'**
  String get intro2Title;

  /// **'Track rainfall, humidity, wind speed...\nContinuously updated.'**
  String get intro2Desc;

  /// **'Global Weather'**
  String get intro3Title;

  /// **'Add any location you want\nand switch easily.'**
  String get intro3Desc;

  /// **'Detailed Temp Map'**
  String get intro4Title;

  /// **'Maps showing temperature\nby area.'**
  String get intro4Desc;

  /// **'Choose location'**
  String get chooseLocationTitle;

  /// **'Locate You'**
  String get locateYouTitle;

  /// **'The app will show weather for your location.\nTap Confirm to continue.'**
  String get locateYouDesc;

  /// **'Confirm location'**
  String get confirmLocation;

  /// **'Weather Map'**
  String get mapTitle;

  /// **'Temperature'**
  String get legendTemperature;

  /// **'Add city'**
  String get addCityTitle;

  /// **'Enter city name...'**
  String get FavoritesCity;

  String get searchHint;

  /// **'Cancel'**
  String get cancel;

  /// **'Add'**
  String get add;

  /// **'{city} has been added to favorites'**
  String get addedToFavorites;

  /// **'{city} removed'**
  String get removedFromFavorites;

  /// **'Unknown'**
  String get unknown;

  /// **'No favorite cities yet.'**
  String get noFavorites;

  /// **'High'**
  String get high;

  /// **'Low'**
  String get low;

  /// **'Light drizzle'**
  String get feelsLike_sub;

  /// **'Moderate'**
  String get uvIndex_sub;

  /// **'Direction: 341° NNW'**
  String get wind_sub;

  /// **'Sunrise: 05:58'**
  String get sunset_sub;

  /// **'Forecast: 17 mm / next 24h'**
  String get rainfall_sub;

  /// **'Clear visibility.'**
  String get visibility_sub;

  /// **'Dew point 21°'**
  String get humidity_sub;

  /// **'Stable'**
  String get pressure_sub;

  /// **'Today'**
  String get today;

  /// **'FEELS LIKE'**
  String get feelsLike;

  /// **'UV INDEX'**
  String get uvIndex;

  /// **'WIND'**
  String get wind;

  /// **'SUNSET'**
  String get sunset;

  /// **'RAINFALL'**
  String get rainfall;

  /// **'VISIBILITY'**
  String get visibility;

  /// **'HUMIDITY'**
  String get humidity;

  /// **'PRESSURE'**
  String get pressure;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
