import 'package:avaproject/success_screen.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      filled: true,
      fillColor: const Color(0xFFFCECEC),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    );

    return Scaffold(
      appBar: AppBar(leading: const CloseButton(), title: const Text('Оплата')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Оплата кредитной картой', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextFormField(decoration: inputDecoration.copyWith(hintText: 'Номер карты')),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: TextFormField(decoration: inputDecoration.copyWith(hintText: 'MM/ГГ'))),
                const SizedBox(width: 12),
                Expanded(child: TextFormField(decoration: inputDecoration.copyWith(hintText: 'CVV/CVC'))),
              ],
            ),
            const SizedBox(height: 12),
            TextFormField(decoration: inputDecoration.copyWith(hintText: 'Email')),
            const SizedBox(height: 12),
            TextFormField(decoration: inputDecoration.copyWith(hintText: 'Имя владельца карты')),
            const Spacer(),
            const Text(
              'Нажимая на кнопку, вы соглашаетесь с условиями обработки персональных данных',
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_)=>SuccessScreen())),
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
                child: const Text('К оплате'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}