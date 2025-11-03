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

  /// No description provided for @titleHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get titleHome;

  /// No description provided for @titleForecast.
  ///
  /// In en, this message translates to:
  /// **'10-Day Forecast'**
  String get titleForecast;

  /// No description provided for @titleSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get titleSettings;

  /// No description provided for @teamInfo.
  ///
  /// In en, this message translates to:
  /// **'Team Information'**
  String get teamInfo;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @myLocation.
  ///
  /// In en, this message translates to:
  /// **'My Location'**
  String get myLocation;

  /// No description provided for @groupHeader.
  ///
  /// In en, this message translates to:
  /// **'GROUP 6 - MOBILE PROGRAMMING'**
  String get groupHeader;

  /// No description provided for @memberRole.
  ///
  /// In en, this message translates to:
  /// **'Member'**
  String get memberRole;

  /// No description provided for @footer.
  ///
  /// In en, this message translates to:
  /// **'Phenikaa University\n© 2025 - Group 6'**
  String get footer;

  /// No description provided for @mssvLabel.
  ///
  /// In en, this message translates to:
  /// **'Student ID'**
  String get mssvLabel;

  /// No description provided for @classLabel.
  ///
  /// In en, this message translates to:
  /// **'Class'**
  String get classLabel;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @splashLine1.
  ///
  /// In en, this message translates to:
  /// **'Weather Forecast'**
  String get splashLine1;

  /// No description provided for @splashLine2.
  ///
  /// In en, this message translates to:
  /// **'Weather'**
  String get splashLine2;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get start;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @intro1Title.
  ///
  /// In en, this message translates to:
  /// **'Hourly Forecast'**
  String get intro1Title;

  /// No description provided for @intro1Desc.
  ///
  /// In en, this message translates to:
  /// **'Get deep weather insights.\nUpdated hourly.'**
  String get intro1Desc;

  /// No description provided for @intro2Title.
  ///
  /// In en, this message translates to:
  /// **'Real-time Weather'**
  String get intro2Title;

  /// No description provided for @intro2Desc.
  ///
  /// In en, this message translates to:
  /// **'Track rainfall, humidity, wind speed...\nContinuously updated.'**
  String get intro2Desc;

  /// No description provided for @intro3Title.
  ///
  /// In en, this message translates to:
  /// **'Global Weather'**
  String get intro3Title;

  /// No description provided for @intro3Desc.
  ///
  /// In en, this message translates to:
  /// **'Add any location you want\nand switch easily.'**
  String get intro3Desc;

  /// No description provided for @intro4Title.
  ///
  /// In en, this message translates to:
  /// **'Detailed Temp Map'**
  String get intro4Title;

  /// No description provided for @intro4Desc.
  ///
  /// In en, this message translates to:
  /// **'Maps showing temperature\nby area.'**
  String get intro4Desc;

  /// No description provided for @chooseLocationTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose location'**
  String get chooseLocationTitle;

  /// No description provided for @locateYouTitle.
  ///
  /// In en, this message translates to:
  /// **'Locate You'**
  String get locateYouTitle;

  /// No description provided for @locateYouDesc.
  ///
  /// In en, this message translates to:
  /// **'The app will show weather for your location.\nTap Confirm to continue.'**
  String get locateYouDesc;

  /// No description provided for @confirmLocation.
  ///
  /// In en, this message translates to:
  /// **'Confirm location'**
  String get confirmLocation;

  /// No description provided for @mapTitle.
  ///
  /// In en, this message translates to:
  /// **'Weather Map'**
  String get mapTitle;

  /// No description provided for @legendTemperature.
  ///
  /// In en, this message translates to:
  /// **'Temperature'**
  String get legendTemperature;

  /// No description provided for @addCityTitle.
  ///
  /// In en, this message translates to:
  /// **'Add city'**
  String get addCityTitle;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Enter city name...'**
  String get FavoritesCity;

  String get searchHint;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @addedToFavorites.
  ///
  /// In en, this message translates to:
  /// **'{city} has been added to favorites'**
  String get addedToFavorites;

  /// No description provided for @removedFromFavorites.
  ///
  /// In en, this message translates to:
  /// **'{city} removed'**
  String get removedFromFavorites;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// No description provided for @noFavorites.
  ///
  /// In en, this message translates to:
  /// **'No favorite cities yet.'**
  String get noFavorites;

  /// No description provided for @high.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get high;

  /// No description provided for @low.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get low;

  /// No description provided for @feelsLike_sub.
  ///
  /// In en, this message translates to:
  /// **'Light drizzle'**
  String get feelsLike_sub;

  /// No description provided for @uvIndex_sub.
  ///
  /// In en, this message translates to:
  /// **'Moderate'**
  String get uvIndex_sub;

  /// No description provided for @wind_sub.
  ///
  /// In en, this message translates to:
  /// **'Direction: 341° NNW'**
  String get wind_sub;

  /// No description provided for @sunset_sub.
  ///
  /// In en, this message translates to:
  /// **'Sunrise: 05:58'**
  String get sunset_sub;

  /// No description provided for @rainfall_sub.
  ///
  /// In en, this message translates to:
  /// **'Forecast: 17 mm / next 24h'**
  String get rainfall_sub;

  /// No description provided for @visibility_sub.
  ///
  /// In en, this message translates to:
  /// **'Clear visibility.'**
  String get visibility_sub;

  /// No description provided for @humidity_sub.
  ///
  /// In en, this message translates to:
  /// **'Dew point 21°'**
  String get humidity_sub;

  /// No description provided for @pressure_sub.
  ///
  /// In en, this message translates to:
  /// **'Stable'**
  String get pressure_sub;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @feelsLike.
  ///
  /// In en, this message translates to:
  /// **'FEELS LIKE'**
  String get feelsLike;

  /// No description provided for @uvIndex.
  ///
  /// In en, this message translates to:
  /// **'UV INDEX'**
  String get uvIndex;

  /// No description provided for @wind.
  ///
  /// In en, this message translates to:
  /// **'WIND'**
  String get wind;

  /// No description provided for @sunset.
  ///
  /// In en, this message translates to:
  /// **'SUNSET'**
  String get sunset;

  /// No description provided for @rainfall.
  ///
  /// In en, this message translates to:
  /// **'RAINFALL'**
  String get rainfall;

  /// No description provided for @visibility.
  ///
  /// In en, this message translates to:
  /// **'VISIBILITY'**
  String get visibility;

  /// No description provided for @humidity.
  ///
  /// In en, this message translates to:
  /// **'HUMIDITY'**
  String get humidity;

  /// No description provided for @pressure.
  ///
  /// In en, this message translates to:
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
