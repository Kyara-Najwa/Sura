import 'package:flutter/material.dart';
import 'theme.dart';

void main() => runApp(const SuraApp());

class SuraApp extends StatelessWidget {
  const SuraApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Sura',
        debugShowCheckedModeBanner: false,
        theme: buildTheme(),
        builder: (context, child) => GradientBackground(child: child!),
        home: const HomeShell(),
      );
}

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;
  static const _titles = ['Komunikasi', 'HUD', 'Benchmark', 'Profil'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sura · ${_titles[_index]}')),
      body: IndexedStack(
        index: _index,
        children: [for (final t in _titles) Center(child: Text(t))],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.chat_bubble_outline),
            selectedIcon: Icon(Icons.chat_bubble),
            label: 'Komunikasi',
          ),
          NavigationDestination(
            icon: Icon(Icons.visibility_outlined),
            selectedIcon: Icon(Icons.visibility),
            label: 'HUD',
          ),
          NavigationDestination(
            icon: Icon(Icons.analytics_outlined),
            selectedIcon: Icon(Icons.analytics),
            label: 'Benchmark',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}