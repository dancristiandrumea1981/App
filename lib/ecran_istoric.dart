import 'package:flutter/material.dart';

class EcranIstoric extends StatelessWidget {
  const EcranIstoric({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de test cu devize salvate
    final List<Map<String, dynamic>> devize = [
      {'client': 'Ion Popescu', 'lucrare': 'Instalație Sanitară Baie', 'total': 1250.0, 'data': '05.09.2026'},
      {'client': 'Maria Ionescu', 'lucrare': 'Montaj Parchet & Plintă', 'total': 800.0, 'data': '02.09.2026'},
      {'client': 'SC Construct SRL', 'lucrare': 'Zugrăvit Spațiu Comercial', 'total': 3400.0, 'data': '28.08.2026'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Istoric Devize Salvate'),
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.white,
      ),
      body: devize.isEmpty
          ? const Center(child: Text('Nu există devize salvate.'))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: devize.length,
              itemBuilder: (context, index) {
                final deviz = devize[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue.shade900,
                      foregroundColor: Colors.white,
                      child: const Icon(Icons.receipt_long),
                    ),
                    title: Text(
                      deviz['client'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${deviz['lucrare']}\nData: ${deviz['data']}'),
                    isThreeLine: true,
                    trailing: Text(
                      '${deviz['total']} RON',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.green.shade800,
                      ),
                    ),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Detalii deviz pentru ${deviz['client']}')),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
