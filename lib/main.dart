import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/providers/theme_provider.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider();
    final chatProvider = ChatProvider(themeProvider);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => chatProvider),
          ChangeNotifierProvider(create: (_) => themeProvider)
        ],
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: AppTheme(
                        selectedColor: themeProvider.selectedColor,
                        brightness: themeProvider.brightness == true
                            ? Brightness.light
                            : Brightness.dark)
                    .theme(),
                title: 'Yes no app',
                home: const ChatScreen());
          },
        ));
  }
}
