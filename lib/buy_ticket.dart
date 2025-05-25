import 'package:avaproject/payment_screen.dart';
import 'package:flutter/material.dart';

class TicketPurchaseScreen extends StatefulWidget {
  const TicketPurchaseScreen({super.key});

  @override
  State<TicketPurchaseScreen> createState() => _TicketPurchaseScreenState();
}

class _TicketPurchaseScreenState extends State<TicketPurchaseScreen> {
  final seatController = TextEditingController();
  final nameController = TextEditingController();
  final ticketPrice = '20 000 ₸';

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF3F3F8F);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 🎤 Название концерта
            const Text(
              'Большой весенний концерт ZAQ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // 🗺 Схема зала
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('assets/images/seating_map.png', fit: BoxFit.cover,),
            ),
            const SizedBox(height: 12),

            // 📍 Локация и дата
            Row(
              children: const [
                Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),
                SizedBox(width: 4),
                Text('Астана, Арбат 12', style: TextStyle(color: Colors.grey)),
                Spacer(),
                Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                SizedBox(width: 4),
                Text('18 Июня 2025 • 18:00', style: TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 24),

            // 🔢 Выбор места
            const Text('Выберите место', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            TextField(
              controller: seatController,
              decoration: const InputDecoration(
                hintText: 'Например: D229',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // 💰 Цена
            const Text('Билет', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            TextField(
              enabled: false,
              decoration: InputDecoration(
                hintText: 'Билет за $ticketPrice',
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // 🙋 Имя
            const Text('Ваше имя', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'на пример: Досым',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),

            // 🔘 Кнопка покупки
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>PaymentScreen()));
                  final seat = seatController.text.trim();
                  final name = nameController.text.trim();

                  if (seat.isEmpty || name.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Пожалуйста, заполните все поля')),
                    );
                    return;
                  }

                  // 👉 Здесь можно добавить сохранение, навигацию или оплату
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Спасибо, $name! Ваше место: $seat')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Купить билет', style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}