import 'package:flutter/material.dart';
import 'package:weather_app/l10n/app_localizations.dart';
import 'package:weather_app/screens/thoitietchinh.dart'; // 🔹 Thêm nếu chưa có

class XacDinhViTriScreen extends StatelessWidget {
  const XacDinhViTriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Gradient bgGradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromARGB(255, 4, 102, 239),
        Color.fromARGB(255, 60, 160, 222),
        Color.fromARGB(255, 218, 227, 234),
      ],
      stops: [0.0, 0.6, 1.0],
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(gradient: bgGradient),
          child: Stack(
            children: [
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 16, right: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: InteractiveViewer(
                      minScale: 1.0,
                      maxScale: 4.0,
                      panEnabled: true,
                      child: Image.asset(
                        'assets/imgs/location.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              Positioned(
                top: 20,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Quay lại trang trước
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ),

              Positioned(
                top: 20,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    AppLocalizations.of(context)!.chooseLocationTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              /// Nội dung
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 40,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(250),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.locateYouTitle,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 60, 160, 222),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        AppLocalizations.of(context)!.locateYouDesc,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),

                      /// 🔹 Nút xác nhận vị trí (đã thêm hiệu ứng fade)
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 800),
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return const WeatherScreen(); // Màn hình chính
                              },
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFC107),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.confirmLocation,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
