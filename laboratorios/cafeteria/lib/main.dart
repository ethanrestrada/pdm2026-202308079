import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cafeteria',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int cafes = 0;
  int sandwiches = 0;
  int jugos = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    ProductoPedido(
                      nombre: 'Cafe',
                      precio: 10,
                      cantidad: cafes,
                      alSumar: () => setState(() => cafes++),
                      alRestar: () {
                        if (cafes > 0) setState(() => cafes--);
                      },
                    ),
                    const Divider(),
                    ProductoPedido(
                      nombre: 'Sandwich',
                      precio: 25,
                      cantidad: sandwiches,
                      alSumar: () => setState(() => sandwiches++),
                      alRestar: () {
                        if (sandwiches > 0) setState(() => sandwiches--);
                      },
                    ),
                    const Divider(),
                    ProductoPedido(
                      nombre: 'Jugo',
                      precio: 12,
                      cantidad: jugos,
                      alSumar: () => setState(() => jugos++),
                      alRestar: () {
                        if (jugos > 0) setState(() => jugos--);
                      },
                    ),
                  ],
                ),
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductoPedido extends StatelessWidget {
  const ProductoPedido({
    super.key,
    required this.nombre,
    required this.precio,
    required this.cantidad,
    required this.alSumar,
    required this.alRestar,
  });

  final String nombre;
  final int precio;
  final int cantidad;
  final VoidCallback alSumar;
  final VoidCallback alRestar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nombre, style: const TextStyle(fontSize: 18)),
                Text('Q${precio.toStringAsFixed(2)}'),
              ],
            ),
          ),
          IconButton(
            onPressed: alRestar,
            icon: const Icon(Icons.remove),
            tooltip: 'Restar 1 $nombre',
          ),
          SizedBox(
            width: 32,
            child: Text('$cantidad', textAlign: TextAlign.center),
          ),
          IconButton(
            onPressed: alSumar,
            icon: const Icon(Icons.add),
            tooltip: 'Sumar 1 $nombre',
          ),
        ],
      ),
    );
  }
}
