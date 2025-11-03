import 'dart:ui';
import 'package:flutter/material.dart';

// ⚡ Thêm các trang mẫu để điều hướng
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        title: const Text("Trang chủ"),
        backgroundColor: Colors.blue[700],
      ),
      body: const Center(
        child: Text("Đây là trang chủ", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class ForecastPage extends StatelessWidget {
  const ForecastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        title: const Text("Dự báo 10 ngày"),
        backgroundColor: Colors.blue[700],
      ),
      body: const Center(
        child: Text(
          "Trang dự báo 10 ngày",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        title: const Text("Cài đặt"),
        backgroundColor: Colors.blue[700],
      ),
      body: const Center(
        child: Text("Trang cài đặt", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

// ------------------ TRANG CHÍNH ------------------

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final now = DateTime.now();

    final isDayTime = now.hour >= 6 && now.hour < 18;
    final todayIcon = isDayTime
        ? "assets/imgs/gioithieu2.png"
        : "assets/imgs/gioithieu1.png";

    final List<Map<String, dynamic>> forecastData = List.generate(10, (index) {
      final date = now.add(Duration(days: index));
      final day =
          "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}";

      final icons = [
        "assets/imgs/gioithieu2.png",
        "assets/imgs/rain.png",
        "assets/imgs/gioithieu3.png",
      ];

      return {
        "day": day,
        "icon": icons[index % icons.length],
        "rainPercent": [10, 20, 40, 60, 80, 30, 50, 70, 25, 90][index],
        "minTemp": [21, 22, 24, 23, 20, 21, 22, 25, 23, 21][index],
        "maxTemp": [28, 30, 33, 29, 25, 27, 28, 34, 30, 26][index],
      };
    });

    final today = forecastData[0];

    return Scaffold(
      body: Stack(
        children: [
          // 🌈 Nền gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 4, 102, 239),
                  Color.fromARGB(255, 60, 160, 222),
                  Color.fromARGB(255, 218, 227, 234),
                ],
                stops: [0.0, 0.6, 1.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // ✅ Nội dung cuộn
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // ☀️ Icon chính hôm nay
                    Image.asset(
                      todayIcon,
                      height: size.height * 0.36,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 10),

                    Text(
                      "${today['maxTemp']}°",
                      style: const TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Vị trí của tôi",
                      style: TextStyle(color: Colors.white, fontSize: 36),
                    ),

                    const SizedBox(height: 6),
                    Text(
                      "Cao: ${today['maxTemp']}°   Thấp: ${today['minTemp']}°",
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 25),

                    // 🏠 Ngôi nhà
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

                    // 📅 Hôm nay (24 giờ)
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
                            children: [
                              const Text(
                                "Hôm nay",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                today['day'],
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            height: 120,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              itemCount: 24,
                              itemBuilder: (context, i) {
                                final time =
                                    "${i.toString().padLeft(2, '0')}:00";
                                final temp =
                                    today['minTemp'] +
                                    ((today['maxTemp'] - today['minTemp']) *
                                            (i / 23))
                                        .round();
                                final hourIcon = (i >= 6 && i < 18)
                                    ? "assets/imgs/gioithieu2.png"
                                    : "assets/imgs/gioithieu1.png";

                                return HourlyForecast(
                                  time: time,
                                  temp: "$temp°C",
                                  iconPath: hourIcon,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),
                    // 📆 Dự báo 10 ngày
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
                            children: forecastData
                                .map(
                                  (day) => DailyForecastRow(
                                    day: day['day'],
                                    rainPercent: day['rainPercent'],
                                    minTemp: day['minTemp'],
                                    maxTemp: day['maxTemp'],
                                    icon: day['icon'],
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    // 🔲 Ô thông tin thời tiết nhỏ (mới thêm)
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

                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),

          // ✅ Thanh 3 icon nổi (nút bấm)
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white24, width: 1),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 76, 163, 218),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.map,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/bando_nhietdo');
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/timkien_thoitiet');
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/favorites_screen');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------- Các widget phụ -------------------

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
              const SizedBox(width: 2),
              Text(
                "$rainPercent%",
                style: const TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 15,
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

// 🧩 Thêm class WeatherInfoCard
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white24, width: 1),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white70, size: 28),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(color: Colors.white70, fontSize: 13),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.white60, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
