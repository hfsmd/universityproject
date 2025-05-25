import 'package:avaproject/buy_ticket.dart';
import 'package:flutter/material.dart';

class EventDetailScreen extends StatelessWidget {
  const EventDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF3F3F8F);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Мероприятие'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🖼 Картинка
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
              ),
                child: Image.asset('assets/images/zaq_poster.png', fit: BoxFit.fill, width: double.infinity)),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 📅 Дата и метка
                  Row(
                    children: const [
                      Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                      SizedBox(width: 6),
                      Text('18 Июня 2025 • 18:00', style: TextStyle(color: Colors.grey)),
                      Spacer(),
                      Chip(label: Text('Концерт'), backgroundColor: Color(0xFFE5E5F7)),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // 🏷 Название
                  const Text(
                    'Большой весенний концерт ZAQ',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  // 📍 Локация
                  Row(
                    children: const [
                      Icon(Icons.location_on_outlined, size: 18, color: Colors.grey),
                      SizedBox(width: 6),
                      Text('Астана, Арбат 12', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // 👥 Участники
                  Row(
                    children: const [
                      Icon(Icons.people_outline, size: 18, color: Colors.grey),
                      SizedBox(width: 6),
                      Text('230 участников', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // 💬 Описание
                  const Text(
                    'Присоединяйтесь к нашему большому весеннему концерту с живой музыкой, атмосферой праздника и незабываемыми впечатлениями!',
                  ),
                  const SizedBox(height: 20),

                  // 👩‍💼 Организатор
                  Row(
                    children: [
                      const CircleAvatar(backgroundImage: AssetImage('assets/images/anna.png'), radius: 20),
                      const SizedBox(width: 12),
                      const Text('Анна Кузнецова • Организатор'),
                      const Spacer(),
                      TextButton(onPressed: () {}, child: const Text('Инфо')),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // 📅 Программа
                  const Text('📌 Программа', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  _buildProgramRow('18:00 — Сбор гостей'),
                  _buildProgramRow('18:30 — Открытие концерта'),
                  _buildProgramRow('19:00 — Выступление групп'),
                  _buildProgramRow('21:00 — Afterparty'),
                  const SizedBox(height: 24),

                  // 🗺 Локация
                  const Text('📍 Локация', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset('assets/images/map.png', fit: BoxFit.cover),
                  ),
                  const SizedBox(height: 24),

                  // ❓ Вопросы и ответы
                  const Text('❓ Вопросы и ответы', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('Что взять с собой? Хорошее настроение, билет и паспорт.\nЕсть ли возрастное ограничение? 16+'),
                  const SizedBox(height: 24),

                  // 💬 Комментарии
                  const Text('💬 Комментарии', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  _buildComment('Иван', 'Будет ли парковка рядом?'),
                  _buildComment('Алена', 'Да, есть платная парковка на соседней улице.'),
                  _buildComment('Мария', 'Иду с нетерпением! 💙'),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Добавить комментарий...',
                      suffixIcon: IconButton(icon: const Icon(Icons.send), onPressed: () {}),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(height: 80), // отступ под кнопку
                ],
              ),
            ),
          ],
        ),
      ),

      // 🎟 Нижняя панель
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              const Text('20 000 ₸', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Spacer(),
              ElevatedButton(
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (_)=>TicketPurchaseScreen()));},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Container(

                    child: const Text('Купить билет', style: TextStyle(color: Colors.white),)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgramRow(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          const Icon(Icons.schedule, size: 18, color: Colors.grey),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }

  Widget _buildComment(String name, String comment) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(radius: 16, child: Icon(Icons.person, size: 18)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 2),
                Text(comment),
              ],
            ),
          ),
        ],
      ),
    );
  }
}