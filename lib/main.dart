import 'package:flutter/material.dart';

void main() => runApp(const MoodBadgeApp());

class MoodBadgeApp extends StatelessWidget {
  const MoodBadgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Badge',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent), // Bluish theme
      ),
      home: const MoodHome(),
    );
  }
}

class MoodHome extends StatefulWidget {
  const MoodHome({super.key});

  @override
  State<MoodHome> createState() => _MoodHomeState();
}

class _MoodHomeState extends State<MoodHome> {
  final List<Map<String, dynamic>> moods = [
    {'label': 'Focused', 'icon': Icons.school},
    {'label': 'Calm', 'icon': Icons.self_improvement},
    {'label': 'Hyped', 'icon': Icons.flash_on},
    {'label': 'Happy', 'icon': Icons.sentiment_satisfied_alt},
    {'label': 'Sleepy', 'icon': Icons.bedtime},
    {'label': 'Inspired', 'icon': Icons.lightbulb},
  ];

  int index = 0;

  void nextMood() {
    setState(() {
      index = (index + 1) % moods.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mood = moods[index];
    final themeColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Badge'),
        backgroundColor: themeColor,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(mood['icon'], size: 96, color: themeColor),
            const SizedBox(height: 12),
            Text(
              mood['label'],
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: themeColor,
                  ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: nextMood,
              style: ElevatedButton.styleFrom(
                backgroundColor: themeColor,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Change Mood'),
            ),
          ],
        ),
      ),
    );
  }
}
