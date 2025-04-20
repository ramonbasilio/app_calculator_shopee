import 'package:flutter/material.dart';

class MercadoLivrePage extends StatefulWidget {
  const MercadoLivrePage({super.key});

  @override
  State<MercadoLivrePage> createState() => _MercadoLivrePageState();
}

class _MercadoLivrePageState extends State<MercadoLivrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mercado Livre Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Em construção... Mercado Livre Page'),
      ), // Placeholder for content
    );
  }
}
