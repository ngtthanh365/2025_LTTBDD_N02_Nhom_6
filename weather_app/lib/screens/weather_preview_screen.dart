import 'package:flutter/material.dart';
import 'thoitietchinh.dart';
import 'city_notifier.dart';
import 'package:weather_app/l10n/app_localizations.dart';

class WeatherPreviewScreen extends StatelessWidget {
  final Map<String, dynamic>? city;
  const WeatherPreviewScreen({super.key, this.city});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final now = DateTime.now();

    final isDayTime = now.hour >= 6 && now.hour < 18;

    final String cityIcon =
        city?['icon'] ??
        (isDayTime
            ? 'assets/imgs/gioithieu2.png'
            : 'assets/imgs/gioithieu1.png');

    final int temp = city?['temp'] ?? 28;
    final int minTemp = city?['min'] ?? 21;
    final int maxTemp = city?['max'] ?? 30;
    // Map Vietnamese status text (from sample data) to canonical keys
    final Map<String, String> viStatusToKey = {
      'Nhiều mây': 'cloudy',
      'Mưa rào': 'rain',
      'Âm u': 'overcast',
      'Nắng nóng': 'hot',
      'Giông bão': 'storm',
      'Trời quang mây': 'clear',
      'Có nắng': 'sunny',
      'Mưa phùn': 'drizzle',
    };

    final Map<String, Map<String, String>> statusTranslations = {
      'cloudy': {'vi': 'Nhiều mây', 'en': 'Cloudy'},
      'rain': {'vi': 'Mưa rào', 'en': 'Showers'},
      'overcast': {'vi': 'Âm u', 'en': 'Overcast'},
      'hot': {'vi': 'Nắng nóng', 'en': 'Hot'},
      'storm': {'vi': 'Giông bão', 'en': 'Stormy'},
      'clear': {'vi': 'Trời quang mây', 'en': 'Clear skies'},
      'sunny': {'vi': 'Có nắng', 'en': 'Sunny'},
      'drizzle': {'vi': 'Mưa phùn', 'en': 'Light drizzle'},
    };

    String _localizedStatus(String rawStatus) {
      final code = Localizations.localeOf(context).languageCode;
      String? key = viStatusToKey[rawStatus];
      if (key == null) {
        for (final entry in statusTranslations.entries) {
          if (entry.value['en']?.toLowerCase() == rawStatus.toLowerCase() ||
              entry.value['vi'] == rawStatus) {
            key = entry.key;
            break;
          }
        }
      }
      if (key != null) return statusTranslations[key]?[code] ?? rawStatus;
      return rawStatus;
    }

    final String status = _localizedStatus(
      city?['status'] ?? AppLocalizations.of(context)!.feelsLike,
    );

    final List<Map<String, dynamic>> forecastData = List.generate(10, (index) {
      final date = now.add(Duration(days: index));
      final day =
          '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}';

      final icons = [
        'assets/imgs/gioithieu2.png',
        'assets/imgs/rain.png',
        'assets/imgs/gioithieu3.png',
      ];

      return {
        'day': day,
        'icon': icons[index % icons.length],
        'rainPercent': [10, 20, 40, 60, 80, 30, 50, 70, 25, 90][index],
        'minTemp': [21, 22, 24, 23, 20, 21, 22, 25, 23, 21][index],
        'maxTemp': [28, 30, 33, 29, 25, 27, 28, 34, 30, 26][index],
      };
    });

    final today = forecastData[0];

    return Scaffold(
      body: Stack(
        children: [
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

          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          AppLocalizations.of(context)!.cancel,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          if (city != null) {
                            addCity({
                              'name': city!['name'],
                              'temp': city!['temp'],
                              'status': city!['status'],
                              'icon':
                                  city!['icon'] ?? 'assets/imgs/gioithieu2.png',
                            });

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  AppLocalizations.of(context)!.addedToFavorites
                                      .replaceAll('{city}', city!['name']),
                                ),
                              ),
                            );
                          }
                        },
                        child: Text(AppLocalizations.of(context)!.add),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            cityIcon,
                            height: size.height * 0.36,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '$temp°',
                            style: const TextStyle(
                              fontSize: 80,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            city?['name'] ??
                                AppLocalizations.of(context)!.myLocation,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '${AppLocalizations.of(context)!.high}: ${maxTemp}°   ${AppLocalizations.of(context)!.low}: ${minTemp}°',
                            style: const TextStyle(
                              color: Colors.white60,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            status,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 25),

                          Center(
                            child: Container(
                              width: 280,
                              height: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                border: Border.all(
                                  color: Colors.white30,
                                  width: 2,
                                ),
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

                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(28),
                              border: Border.all(
                                color: Colors.white24,
                                width: 1,
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.today,
                                      style: const TextStyle(
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
                                          '${i.toString().padLeft(2, '0')}:00';
                                      final tempHour =
                                          minTemp +
                                          ((maxTemp - minTemp) * (i / 23))
                                              .round();
                                      final hourIcon = (i >= 6 && i < 18)
                                          ? 'assets/imgs/gioithieu2.png'
                                          : 'assets/imgs/gioithieu1.png';

                                      return HourlyForecast(
                                        time: time,
                                        temp: '$tempHour°C',
                                        iconPath: hourIcon,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 30),

                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(28),
                              border: Border.all(
                                color: Colors.white24,
                                width: 1,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.titleForecast,
                                  style: const TextStyle(
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

                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: GridView.count(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                WeatherInfoCard(
                                  title: AppLocalizations.of(
                                    context,
                                  )!.feelsLike,
                                  value: '24°',
                                  subtitle: AppLocalizations.of(
                                    context,
                                  )!.feelsLike_sub,
                                  icon: Icons.thermostat,
                                ),
                                WeatherInfoCard(
                                  title: AppLocalizations.of(context)!.uvIndex,
                                  value: '3',
                                  subtitle: AppLocalizations.of(
                                    context,
                                  )!.uvIndex_sub,
                                  icon: Icons.wb_sunny_outlined,
                                ),
                                WeatherInfoCard(
                                  title: AppLocalizations.of(context)!.wind,
                                  value: '9 km/h',
                                  subtitle: AppLocalizations.of(
                                    context,
                                  )!.wind_sub,
                                  icon: Icons.air,
                                ),
                                WeatherInfoCard(
                                  title: AppLocalizations.of(context)!.sunset,
                                  value: '17:22',
                                  subtitle: AppLocalizations.of(
                                    context,
                                  )!.sunset_sub,
                                  icon: Icons.wb_twilight,
                                ),
                                WeatherInfoCard(
                                  title: AppLocalizations.of(context)!.rainfall,
                                  value: '3 mm',
                                  subtitle: AppLocalizations.of(
                                    context,
                                  )!.rainfall_sub,
                                  icon: Icons.water_drop_outlined,
                                ),
                                WeatherInfoCard(
                                  title: AppLocalizations.of(
                                    context,
                                  )!.visibility,
                                  value: '15 km',
                                  subtitle: AppLocalizations.of(
                                    context,
                                  )!.visibility_sub,
                                  icon: Icons.remove_red_eye_outlined,
                                ),
                                WeatherInfoCard(
                                  title: AppLocalizations.of(context)!.humidity,
                                  value: '85%',
                                  subtitle: AppLocalizations.of(
                                    context,
                                  )!.humidity_sub,
                                  icon: Icons.grain_outlined,
                                ),
                                WeatherInfoCard(
                                  title: AppLocalizations.of(context)!.pressure,
                                  value: '1009 hPa',
                                  subtitle: AppLocalizations.of(
                                    context,
                                  )!.pressure_sub,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
