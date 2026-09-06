import 'package:flutter/material.dart';
import 'ecran_pro.dart';

class EcranDeviz extends StatefulWidget {
  const EcranDeviz({super.key});

  @override
  State<EcranDeviz> createState() => _EcranDevizState();
}

class _EcranDevizState extends State<EcranDeviz> {
  final _formKey = GlobalKey<FormState>();
  final _clientController = TextEditingController();
  final _lucrareController = TextEditingController();
  final _manoperaController = TextEditingController();
  final _materialeController = TextEditingController();

  double _total = 0.0;

  void _calculeazaTotal() {
    final manopera = double.tryParse(_manoperaController.text) ?? 0.0;
    final materiale = double.tryParse(_materialeController.text) ?? 0.0;
    setState(() {
      _total = manopera + materiale;
    });
  }

  void _salveazaDeviz() {
    if (_formKey.currentState!.validate()) {
      _calculeazaTotal();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Deviz salvat pentru ${_clientController.text}! Total: $_total RON'),
          backgroundColor: Colors.green.shade800,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deviz Nou - DC Drumea'),
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.workspace_premium, color: Colors.amber),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EcranPro()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAlignment.start,
            children: [
              Text(
                'Date Deviz / Lucrare',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _clientController,
                decoration: const InputDecoration(
                  labelText: 'Nume Client',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (val) => val == null || val.isEmpty ? 'Introduceți numele clientului' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _lucrareController,
                decoration: const InputDecoration(
                  labelText: 'Descriere Lucrare',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.build),
                ),
                validator: (val) => val == null || val.isEmpty ? 'Introduceți descrierea lucrării' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _manoperaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Cost Manoperă (RON)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.engineering),
                ),
                onChanged: (_) => _calculeazaTotal(),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _materialeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Cost Materiale (RON)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.inventory_2),
                ),
                onChanged: (_) => _calculeazaTotal(),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue.shade200),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'TOTAL GENERAL:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$_total RON',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: _salveazaDeviz,
                  icon: const Icon(Icons.save),
                  label: const Text('SALVEAZĂ DEVIZUL', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
