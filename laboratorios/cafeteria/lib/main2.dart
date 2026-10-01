import 'package:flutter/material.dart';

void main() {
  runApp(const MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  const MiAplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi pedido',
      home: const PantallaPedido(),
    );
  }
}

class PantallaPedido extends StatefulWidget {
  const PantallaPedido({super.key});

  @override
  State<PantallaPedido> createState() => _PantallaPedidoState();
}

class _PantallaPedidoState extends State<PantallaPedido> {
  int cafes = 0;
  int sandwiches = 0;
  int jugos = 0;

  @override
  Widget build(BuildContext context) {
    final int total = cafes * 10 + sandwiches * 25 + jugos * 12;

    return Scaffold(
      appBar: AppBar(title: const Text('Mi pedido')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    ProductoPedido(
                      nombre: 'Café',
                      precio: 10,
                      cantidad: cafes,
                      alSumar: () => setState(() => cafes++),
                      alRestar: () {
                        if (cafes > 0) setState(() => cafes--);
                      },
                    ),
                    const Divider(),
                    ProductoPedido(
                      nombre: 'Sándwich',
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total', style: TextStyle(fontSize: 20)),
                    Text(
                      'Q${total.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      cafes = 0;
                      sandwiches = 0;
                      jugos = 0;
                    });
                  },
                  child: const Text('Vaciar pedido'),
                ),
              ),
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
