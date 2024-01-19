import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple
  ];

  void playAudio(int noteNumber) async {
    try {
      final player = AudioPlayer();
      await player.play(AssetSource('note$noteNumber.wav'));
    } catch (e) {
      print('Errore durante la riproduzione audio: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (int i = 0; i < 7; i++)
                Expanded(
                  child: Material(
                    child: InkWell(
                      splashColor: Colors.white.withOpacity(0.5),
                      onTap: () => playAudio(i + 1),
                      child: Ink(
                        decoration: BoxDecoration(
                          color: colors[i],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(1),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(-2, -2),
                              blurStyle: BlurStyle.outer,
                            ),
                          ],
                        ),
                        child: const SizedBox.shrink(),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
