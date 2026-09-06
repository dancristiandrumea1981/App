import 'package:flutter/material.dart';
import 'ecran_deviz.dart';
import 'ecran_istoric.dart';

void main() {
  runApp(const MeseriesApp());
}

class MeseriesApp extends StatelessWidget {
  const MeseriesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DC Drumea Solutions',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const EcranNavigare(),
    );
  }
}

class EcranNavigare extends StatefulWidget {
  const EcranNavigare({super.key});

  @override
  State<EcranNavigare> createState() => _EcranNavigareState();
}

class _EcranNavigareState extends State<EcranNavigare> {
  int _index = 0;
  final List<Widget> _ecrane = const [EcranDeviz(), EcranIstoric()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _ecrane[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        selectedItemColor: Colors.blue.shade900,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add_assignment), label: 'Deviz Nou'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Istoric'),
        ],
      ),
    );
  }
}
