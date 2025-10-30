import 'dart:ui';
import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF2C2C54),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 4, 102, 239),
              Color.fromARGB(255, 60, 160, 222),
              Color.fromARGB(255, 218, 227, 234),
            ],
            stops: [0.0, 0.6, 1.0],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //  Mây
                  Image.asset(
                    'assets/imgs/icon1.png',
                    height: size.height * 0.36,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 10),

                  //  Nhiệt độ
                  const Text(
                    "19°",
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Hà Nội",
                    style: TextStyle(color: Colors.white, fontSize: 36),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Cao: 24°   Thấp: 18°",
                    style: TextStyle(color: Colors.white60, fontSize: 16),
                  ),

                  const SizedBox(height: 25),

                  //  Ảnh ngôi nhà (giữ kích thước cố định)
                  Center(
                    child: Container(
                      width: 280,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(color: Colors.white30, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/imgs/House.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  //  Khung hôm nay
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(color: Colors.white24, width: 1),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Hôm nay",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "01 Tháng 11",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 120,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            children: const [
                              HourlyForecast(
                                time: "06:00",
                                temp: "20°C",
                                iconPath: "assets/imgs/rain.png",
                              ),
                              HourlyForecast(
                                time: "09:00",
                                temp: "24°C",
                                iconPath: "assets/imgs/rain.png",
                              ),
                              HourlyForecast(
                                time: "12:00",
                                temp: "27°C",
                                iconPath: "assets/imgs/rain.png",
                              ),
                              HourlyForecast(
                                time: "15:00",
                                temp: "25°C",
                                iconPath: "assets/imgs/rain.png",
                              ),
                              HourlyForecast(
                                time: "18:00",
                                temp: "22°C",
                                iconPath: "assets/imgs/rain.png",
                              ),
                              HourlyForecast(
                                time: "21:00",
                                temp: "19°C",
                                iconPath: "assets/imgs/rain.png",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  //  Dự báo 10 ngày
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(color: Colors.white24, width: 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Dự báo 10 ngày",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Column(
                          children: const [
                            DailyForecastRow(
                              day: "Hôm nay",
                              rainPercent: 85,
                              minTemp: 22,
                              maxTemp: 25,
                              icon: "assets/imgs/rain.png",
                            ),
                            DailyForecastRow(
                              day: "Th 6",
                              rainPercent: 90,
                              minTemp: 22,
                              maxTemp: 26,
                              icon: "assets/imgs/rain.png",
                            ),
                            DailyForecastRow(
                              day: "Th 7",
                              rainPercent: 75,
                              minTemp: 20,
                              maxTemp: 24,
                              icon: "assets/imgs/rain.png",
                            ),
                            DailyForecastRow(
                              day: "CN",
                              rainPercent: 50,
                              minTemp: 19,
                              maxTemp: 25,
                              icon: "assets/imgs/rain.png",
                            ),
                            DailyForecastRow(
                              day: "Th 2",
                              rainPercent: 40,
                              minTemp: 18,
                              maxTemp: 26,
                              icon: "assets/imgs/rain.png",
                            ),
                            DailyForecastRow(
                              day: "Th 3",
                              rainPercent: 35,
                              minTemp: 20,
                              maxTemp: 27,
                              icon: "assets/imgs/rain.png",
                            ),
                            DailyForecastRow(
                              day: "Th 4",
                              rainPercent: 20,
                              minTemp: 21,
                              maxTemp: 29,
                              icon: "assets/imgs/rain.png",
                            ),
                            DailyForecastRow(
                              day: "Th 5",
                              rainPercent: 10,
                              minTemp: 22,
                              maxTemp: 30,
                              icon: "assets/imgs/rain.png",
                            ),
                            DailyForecastRow(
                              day: "Th 6",
                              rainPercent: 30,
                              minTemp: 23,
                              maxTemp: 28,
                              icon: "assets/imgs/rain.png",
                            ),
                            DailyForecastRow(
                              day: "Th 7",
                              rainPercent: 55,
                              minTemp: 21,
                              maxTemp: 27,
                              icon: "assets/imgs/rain.png",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  //  Các ô thông tin thời tiết nhỏ (giống iOS)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        WeatherInfoCard(
                          title: "CẢM NHẬN",
                          value: "24°",
                          subtitle: "Mưa phùn nhẹ",
                          icon: Icons.thermostat,
                        ),
                        WeatherInfoCard(
                          title: "CHỈ SỐ UV",
                          value: "3",
                          subtitle: "Trung bình",
                          icon: Icons.wb_sunny_outlined,
                        ),
                        WeatherInfoCard(
                          title: "GIÓ",
                          value: "9 km/h",
                          subtitle: "Hướng: 341° BTB",
                          icon: Icons.air,
                        ),
                        WeatherInfoCard(
                          title: "MẶT TRỜI LẶN",
                          value: "17:22",
                          subtitle: "Mọc: 05:58",
                          icon: Icons.wb_twilight,
                        ),
                        WeatherInfoCard(
                          title: "LƯỢNG MƯA",
                          value: "3 mm",
                          subtitle: "Dự báo: 17 mm / 24h tới",
                          icon: Icons.water_drop_outlined,
                        ),
                        WeatherInfoCard(
                          title: "TẦM NHÌN",
                          value: "15 km",
                          subtitle: "Tầm nhìn rõ.",
                          icon: Icons.remove_red_eye_outlined,
                        ),
                        WeatherInfoCard(
                          title: "ĐỘ ẨM",
                          value: "85%",
                          subtitle: "Điểm sương 21°",
                          icon: Icons.grain_outlined,
                        ),
                        WeatherInfoCard(
                          title: "ÁP SUẤT",
                          value: "1009 hPa",
                          subtitle: "Ổn định",
                          icon: Icons.speed_outlined,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  //  Thanh icon dưới cùng
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.white70,
                          size: 30,
                        ),
                        Icon(
                          Icons.add_circle_outline,
                          color: Colors.white70,
                          size: 30,
                        ),
                        Icon(Icons.menu, color: Colors.white70, size: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ------------------- Widget dự báo theo giờ -------------------
class HourlyForecast extends StatelessWidget {
  final String time;
  final String temp;
  final String iconPath;
  const HourlyForecast({
    super.key,
    required this.time,
    required this.temp,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white24, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, height: 35, fit: BoxFit.contain),
          const SizedBox(height: 6),
          Text(temp, style: const TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(height: 4),
          Text(
            time,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

// ------------------- Widget Dự báo 10 ngày -------------------
class DailyForecastRow extends StatelessWidget {
  final String day;
  final int rainPercent;
  final int minTemp;
  final int maxTemp;
  final String icon;

  const DailyForecastRow({
    super.key,
    required this.day,
    required this.rainPercent,
    required this.minTemp,
    required this.maxTemp,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 60,
            child: Text(
              day,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(icon, width: 26, height: 26),
              const SizedBox(width: 4),
              Text(
                "$rainPercent%",
                style: const TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Text(
            "$minTemp°",
            style: const TextStyle(color: Colors.white70, fontSize: 16),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Container(
                height: 4,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.yellow, Colors.orange],
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          Text(
            "$maxTemp°",
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

// ------------------- Ô thông tin thời tiết -------------------
class WeatherInfoCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;

  const WeatherInfoCard({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white24, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: Colors.white70, size: 22),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.white70, fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
