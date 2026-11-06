
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String selectedLanguage = 'en';

  final Map<String, Map<String, String>> translations = {
    'en': {
      'welcome': 'Welcome',
      'login': 'Log in',
      'settings': 'Settings',
    },
    'ml': {
      'welcome': 'സ്വാഗതം',
      'login': 'ലോഗിൻ ചെയ്യുക',
      'settings': 'ക്രമീകരണങ്ങൾ',
    },
    'hi': {
      'welcome': 'स्वागत है',
      'login': 'लॉग इन करें',
      'settings': 'सेटिंग्स',
    },
  };

  @override
  Widget build(BuildContext context) {
    final currentTranslations = translations[selectedLanguage]!;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Localization App'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton<String>(
                  value: selectedLanguage,
                  items: const [
                    DropdownMenuItem(
                      value: 'en',
                      child: Text('English'),
                    ),
                    DropdownMenuItem(
                      value: 'ml',
                      child: Text('Malayalam'),
                    ),
                    DropdownMenuItem(
                      value: 'hi',
                      child: Text('Hindi'),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedLanguage = value;
                      });
                    }
                  },
                ),
                const SizedBox(height: 30),
                Text(
                  currentTranslations['welcome']!,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(currentTranslations['login']!),
                ),
                const SizedBox(height: 20),
                Text(
                  currentTranslations['settings']!,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
