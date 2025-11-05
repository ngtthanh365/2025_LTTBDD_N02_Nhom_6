import 'package:flutter/material.dart';
import 'package:weather_app/screens/mhtam.dart';
import 'city_notifier.dart';
import 'package:weather_app/l10n/app_localizations.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final TextEditingController _searchController = TextEditingController();

  // ✅ Hàm mở chi tiết thành phố với hiệu ứng phóng to dần
  void _showCityPreview(Map<String, dynamic> city) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        reverseTransitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (context, animation, secondaryAnimation) => Mhtam(city: city),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutBack, // hiệu ứng phóng to mềm mại
            reverseCurve: Curves.easeInBack,
          );

          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.85, end: 1.0).animate(curvedAnimation),
              child: child,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // status translations (map Vietnamese sample data to keys)
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

    String _localizedStatus(BuildContext ctx, String rawStatus) {
      final code = Localizations.localeOf(ctx).languageCode;
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

    return Scaffold(
      backgroundColor: Color(0xFF002B5B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF002B5B),
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 22),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppLocalizations.of(context)!.FavoritesCity,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
        titleSpacing: -8,
      ),
      body: Container(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔍 Search bar
                TextField(
                  controller: _searchController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.searchHint,
                    hintStyle: const TextStyle(color: Colors.white70),
                    prefixIcon: const Icon(Icons.search, color: Colors.white70),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (_) => setState(() {}),
                ),
                const SizedBox(height: 16),

                // 📋 Danh sách thành phố yêu thích
                Expanded(
                  child: ValueListenableBuilder<List<Map<String, dynamic>>>(
                    valueListenable: favoriteCities,
                    builder: (context, cities, _) {
                      final query = _searchController.text.toLowerCase();
                      final filteredCities = cities
                          .where(
                            (c) => c['name'].toString().toLowerCase().contains(
                              query,
                            ),
                          )
                          .toList();

                      if (filteredCities.isEmpty) {
                        return Center(
                          child: Text(
                            AppLocalizations.of(context)!.noFavorites,
                            style: const TextStyle(color: Colors.white70),
                          ),
                        );
                      }

                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: filteredCities.length,
                        itemBuilder: (context, index) {
                          final city = filteredCities[index];
                          final cityName = city['name'] ?? 'Unknown';

                          return Dismissible(
                            key: Key(cityName),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                              ),
                              margin: const EdgeInsets.only(bottom: 16),
                              decoration: BoxDecoration(
                                color: Colors.redAccent.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(22),
                              ),
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            onDismissed: (direction) {
                              removeCity(cityName);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    AppLocalizations.of(context)!
                                        .removedFromFavorites
                                        .replaceAll('{city}', cityName),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                            },
                            child: GestureDetector(
                              // ✅ Thay bằng hàm có hiệu ứng animation
                              onTap: () => _showCityPreview(city),
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF5C2E91),
                                      Color(0xFF3A1C71),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // 🌡 Thông tin bên trái
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${city['temp'] ?? '--'}°",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          "${AppLocalizations.of(context)!.high}: ${city['high'] ?? '22'}°   ${AppLocalizations.of(context)!.low}: ${city['low'] ?? '10'}°",
                                          style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 13,
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          "$cityName, ${city['country'] ?? ''}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          _localizedStatus(
                                            context,
                                            city['status'] ??
                                                AppLocalizations.of(
                                                  context,
                                                )!.unknown,
                                          ),
                                          style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),

                                    // ☁️ Icon thời tiết
                                    Image.asset(
                                      city['icon'] ??
                                          "assets/imgs/gioithieu2.png",
                                      height: 130,
                                      fit: BoxFit.contain,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
