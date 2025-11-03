import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import các màn hình
import 'screens/bando_nhietdo.dart';
import 'screens/favorites_screen.dart';
import 'screens/mhtam.dart';
import 'screens/thoitietchinh.dart';
import 'screens/timkiem_thoitiet.dart';
import 'screens/weather_preview_screen.dart';
import 'screens/xacdinhvitri.dart';

// import các màn hình
import 'screens/modau.dart';
import 'screens/gioithieu1.dart';
import 'screens/gioithieu2.dart';
import 'screens/gioithieu3.dart';
import 'screens/gioithieu4.dart';
import 'screens/thongtin_nhom_page.dart';

// ✅ import localization được tạo từ flutter gen-l10n (CHỈNH LẠI CHO ĐÚNG)
import 'package:weather_app/l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ⚡ Lấy ngôn ngữ đã lưu, mặc định là 'vi'
  final prefs = await SharedPreferences.getInstance();
  final String languageCode = prefs.getString('language') ?? 'vi';

  runApp(MyApp(initialLocale: Locale(languageCode)));
}

class MyApp extends StatefulWidget {
  final Locale initialLocale;
  const MyApp({super.key, required this.initialLocale});

  // ⚡ Hàm thay đổi ngôn ngữ runtime
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Locale _locale;

  @override
  void initState() {
    super.initState();
    _locale = widget.initialLocale;
  }

  // ⚡ Cập nhật locale và rebuild MaterialApp
  void setLocale(Locale locale) {
    setState(() => _locale = locale);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Forecast App',
      debugShowCheckedModeBanner: false,

      // 🌐 Cấu hình ngôn ngữ
      locale: _locale,
      supportedLocales: const [
        Locale('vi'), // Tiếng Việt
        Locale('en'), // English
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate, // ✅ Delegate của localization bạn tạo
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      // Ghi route ở đây
      initialRoute: '/modau',
      routes: {
        '/modau': (context) => const ModauScreen(), // màn 1
        '/gioithieu1': (context) => const GioiThieu1Screen(), // màn 2
        '/gioithieu2': (context) => const GioiThieu2Screen(), // màn 3
        '/gioithieu3': (context) => const GioiThieu3Screen(), // màn 4
        '/gioithieu4': (context) => const GioiThieu4Screen(), // màn 5
        '/xacdinhvitri': (context) => const XacDinhViTriScreen(),
        '/thoitietchinh': (context) => const WeatherScreen(),
        '/bando_nhietdo': (context) => const BanDoNhietDo(),
        '/timkien_thoitiet': (context) => const TimKiemThanhPho(),
        '/weather_preview_screen': (context) => WeatherPreviewScreen(city: {}),
        '/favorites_screen': (context) => const FavoritesScreen(),
        '/mhtam': (context) => const Mhtam(),
        '/thongtin_nhom': (context) => const ThongTinNhomPage(),
        // '/home': (context) => const HomeScreen(), // nếu sau này cần
      },

      // 🎨 Theme của app
      theme: ThemeData(useMaterial3: true),
    );
  }
}
