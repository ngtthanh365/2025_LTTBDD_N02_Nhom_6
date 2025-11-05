import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/main.dart';

void main() {
  testWidgets('App should load with initial locale vi', (
    WidgetTester tester,
  ) async {
    // 🏗️ Khởi tạo app với ngôn ngữ mặc định là tiếng Việt
    await tester.pumpWidget(const MyApp(initialLocale: Locale('vi')));

    // ⏳ Chờ app load xong toàn bộ frame đầu tiên
    await tester.pumpAndSettle();

    // ✅ Kiểm tra xem MaterialApp có hiển thị hay không
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
