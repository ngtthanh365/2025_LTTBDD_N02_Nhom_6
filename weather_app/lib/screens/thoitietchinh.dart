import 'dart:ui';
import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final now = DateTime.now();

    // 🔆 Xác định ban ngày / ban đêm để đổi icon tự động
    final isDayTime = now.hour >= 6 && now.hour < 18;
    final todayIcon = isDayTime
        ? "assets/imgs/gioithieu2.png" // mặt trời
        : "assets/imgs/gioithieu1.png"; // mặt trăng

    // 🌤 Dữ liệu dự báo 10 ngày
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

    final today = forecastData[0]; // ✅ Hôm nay = ngày đầu tiên

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
                    // ☀️ Icon chính của hôm nay (tự đổi theo giờ)
                    Image.asset(
                      todayIcon,
                      height: size.height * 0.36,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 10),

                    // 🌡️ Nhiệt độ
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
                      "Hà Nội",
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

                    // 📅 Hôm nay (24 giờ & đồng bộ)
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

                          // ✅ Sinh 24 giờ — tự đổi icon ngày/đêm
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

                                // ✅ Giờ nào thuộc ban đêm thì dùng icon mặt trăng
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

                    // 🔲 Ô thông tin nhỏ
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

                    const SizedBox(height: 120),
                  ],
                ),
              ),
            ),
          ),

          // ✅ Thanh 3 icon nổi
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
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 76, 163, 218),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    Icon(
                      Icons.add_circle_outline,
                      color: Colors.white,
                      size: 30,
                    ),
                    Icon(Icons.menu, color: Colors.white, size: 30),
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
