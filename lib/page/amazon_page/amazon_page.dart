import 'package:flutter/material.dart';

class AmazonPage extends StatefulWidget {
  const AmazonPage({super.key});

  @override
  State<AmazonPage> createState() => _AmazonPageState();
}

class _AmazonPageState extends State<AmazonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Amazon Page'), centerTitle: true,),
      body: Center(child: Text('Em construção... Amazon Page')), // Placeholder for content
    );
  }
}
