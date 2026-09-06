import 'package:flutter/material.dart';

class EcranPro extends StatelessWidget {
  const EcranPro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DC DRUMEA PRO'),
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Icon(Icons.workspace_premium, size: 80, color: Colors.amber),
            const SizedBox(height: 10),
            Text(
              'Abonament DC Drumea PRO',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue.shade900),
            ),
            const SizedBox(height: 20),
            const ListTile(
              leading: Icon(Icons.check, color: Colors.green),
              title: Text('Generare devize nelimitate'),
            ),
            const ListTile(
              leading: Icon(Icons.check, color: Colors.green),
              title: Text('Export PDF & Trimitere WhatsApp'),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber.shade800, foregroundColor: Colors.white),
                onPressed: () => Navigator.pop(context),
                child: const Text('ACTIVARE ABONAMENT (29 RON/lună)'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
