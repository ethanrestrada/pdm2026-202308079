import 'package:flutter/material.dart';

void main() => runApp(const MarcadorApp());

const verde = Color(0xFF355E3B);
const neutro = Color(0xFF3A3F47);
const fondo = Color(0xFF14171C);

class MarcadorApp extends StatelessWidget {
  const MarcadorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Marcador(),
    );
  }
}

class Marcador extends StatefulWidget {
  const Marcador({super.key});

  @override
  State<Marcador> createState() => _MarcadorState();
}

class _MarcadorState extends State<Marcador> {
  String nombreA = 'Equipo A';
  String nombreB = 'Equipo B';
  int puntosA = 0;
  int puntosB = 0;

  // El ganador se calcula comparando los puntos.
  bool get ganaA => puntosA > puntosB;
  bool get ganaB => puntosB > puntosA;

  String get mensaje {
    if (puntosA == puntosB) return 'Empate';
    if (ganaA) return 'Va ganando $nombreA';
    return 'Va ganando $nombreB';
  }

  void sumarA() {
    setState(() {
      puntosA = puntosA + 1;
    });
  }

  void restarA() {
    setState(() {
      if (puntosA > 0) puntosA = puntosA - 1;
    });
  }

  void sumarB() {
    setState(() {
      puntosB = puntosB + 1;
    });
  }

  void restarB() {
    setState(() {
      if (puntosB > 0) puntosB = puntosB - 1;
    });
  }

  void reiniciar() {
    setState(() {
      puntosA = 0;
      puntosB = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondo,
      appBar: AppBar(
        title: const Text('Marcador'),
        centerTitle: true,
        backgroundColor: fondo,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                // Lado izquierdo: Equipo A
                Expanded(
                  child: Container(
                    height: 72,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ganaA ? verde : neutro,
                      borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(36),
                      ),
                    ),
                    child: Text(
                      nombreA.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                // Centro
                Container(
                  width: 130,
                  height: 72,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E2228),
                    border: Border.all(color: Colors.white38, width: 3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$puntosA',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: 2,
                        height: 36,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        color: Colors.white54,
                      ),
                      Text(
                        '$puntosB',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Container(
                    height: 72,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ganaB ? verde : neutro,
                      borderRadius: const BorderRadius.horizontal(
                        right: Radius.circular(36),
                      ),
                    ),
                    child: Text(
                      nombreB.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Botones del Equipo A
                Expanded(
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: sumarA,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: verde,
                          foregroundColor: Colors.white,
                          shape: const CircleBorder(),
                          fixedSize: const Size(52, 52),
                          padding: EdgeInsets.zero,
                        ),
                        child: const Text('+1', style: TextStyle(fontSize: 18)),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: restarA,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: verde,
                          foregroundColor: Colors.white,
                          shape: const CircleBorder(),
                          fixedSize: const Size(52, 52),
                          padding: EdgeInsets.zero,
                        ),
                        child: const Text('-1', style: TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),
                ),

                // Espacio del centro
                const SizedBox(width: 130),

                // Botones del Equipo B
                Expanded(
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: sumarB,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: verde,
                          foregroundColor: Colors.white,
                          shape: const CircleBorder(),
                          fixedSize: const Size(52, 52),
                          padding: EdgeInsets.zero,
                        ),
                        child: const Text('+1', style: TextStyle(fontSize: 18)),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: restarB,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: verde,
                          foregroundColor: Colors.white,
                          shape: const CircleBorder(),
                          fixedSize: const Size(52, 52),
                          padding: EdgeInsets.zero,
                        ),
                        child: const Text('-1', style: TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            Text(
              mensaje,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: reiniciar,
              style: ElevatedButton.styleFrom(
                backgroundColor: verde,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 14,
                ),
              ),
              child: const Text('Reiniciar', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
