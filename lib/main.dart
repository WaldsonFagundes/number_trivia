import 'package:flutter/material.dart';
import 'package:trivia/features/number_trivia/presentation/page/number_trivia_page.dart';
import 'package:trivia/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
     title: 'Number Trivia',
      home: NumberTriviaPage(),

    );
  }
}

