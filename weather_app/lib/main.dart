import 'package:flutter/material.dart';
import 'package:weather_app/screens/bando_nhietdo.dart';
import 'package:weather_app/screens/favorites_screen.dart';
import 'package:weather_app/screens/mhtam.dart';
import 'package:weather_app/screens/thoitietchinh.dart';
import 'package:weather_app/screens/timkiem_thoitiet.dart';
import 'package:weather_app/screens/weather_preview_screen.dart';
import 'package:weather_app/screens/xacdinhvitri.dart';

// import các màn hình
import 'screens/modau.dart';
import 'screens/gioithieu1.dart';
import 'screens/gioithieu2.dart';
import 'screens/gioithieu3.dart';
import 'screens/gioithieu4.dart';
import 'screens/thongtin_nhom_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Forecast App',
      debugShowCheckedModeBanner: false,
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
      theme: ThemeData(useMaterial3: true),
    );
  }
}
