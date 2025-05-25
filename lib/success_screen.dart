import 'package:avaproject/main_page.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final date = '21 Мая 2025 15:50';

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Спасибо за покупку', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            Image.asset('assets/images/qr_ticket.png', width: 200, height: 200),
            const SizedBox(height: 12),
            const Text('Покажите QR-код при входе'),
            const SizedBox(height: 8),
            Text(date, style: const TextStyle(color: Colors.black54)),
            const Spacer(),
            const Text('Вы можете найти билет в разделе "Мои билеты"'),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_)=>MainPage())),
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
              child: const Text('На Главный Экран'),
            ),
          ],
        ),
      ),
    );
  }
}