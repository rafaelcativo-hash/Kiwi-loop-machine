import 'package:flutter/material.dart';

void main() {
  runApp(const KiwiApp());
}

class KiwiApp extends StatelessWidget {
  const KiwiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kiwi Loop Machine',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1E1E2C),
      ),
      home: const KiwiHomeScreen(),
    );
  }
}

class KiwiHomeScreen extends StatelessWidget {
  const KiwiHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // --- SECCIÓN SUPERIOR: 4 Pistas (Batería, Bajo, Teclados, Guitarra) ---
            Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.all(8),
                color: const Color(0xFF252538),
                child: Column(
                  children: [
                    _buildTrackRow("BATERÍA A", Colors.blueAccent, Icons.album),
                    _buildTrackRow("BAJO", Colors.blue, Icons.music_note),
                    _buildTrackRow("TECLADOS", Colors.lightBlueAccent, Icons.piano),
                    _buildTrackRow("GUITARRA", Colors.cyan, Icons.speaker),
                  ],
                ),
              ),
            ),

            // --- BARRA DE TRANSPORTE Y METRÓNOMO ---
            Container(
              height: 60,
              color: const Color(0xFF1A1A26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(icon: const Icon(Icons.play_arrow, color: Colors.white), onPressed: () {}),
                  const SizedBox(width: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text("124 BPM", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    icon: const Icon(Icons.fiber_manual_record, color: Colors.white),
                    label: const Text("RECORD", style: TextStyle(color: Colors.white)),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // --- SECCIÓN INFERIOR: Live Mic Rec ---
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.all(12),
                color: const Color(0xFF15151F),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("[LIVE MIC REC]", style: TextStyle(color: Colors.white70, fontSize: 12)),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                          child: const Text("REC", style: TextStyle(color: Colors.white)),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.white12),
                        ),
                        child: const Center(
                          child: Text("Ondas de Audio (Waveform)", style: TextStyle(color: Colors.white38)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrackRow(String name, Color color, IconData icon) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 3),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF2E2E42),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white70, size: 20),
            const SizedBox(width: 8),
            SizedBox(width: 80, child: Text(name, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold))),
            _controlBtn("M"),
            _controlBtn("S"),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                height: 28,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: color, width: 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _controlBtn(String label) {
    return Container(
      width: 24,
      height: 24,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(label, style: const TextStyle(color: Colors.white70, fontSize: 10, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
