import 'package:flutter/material.dart';

class Event {
  final String title;
  final String image;
  final bool isFree;
  final String category;

  Event({
    required this.title,
    required this.image,
    required this.isFree,
    required this.category,
  });
}

class EventCategoryScreen extends StatefulWidget {
  @override
  _EventCategoryScreenState createState() => _EventCategoryScreenState();
}

class _EventCategoryScreenState extends State<EventCategoryScreen> {
  final List<String> categories = [
    'Все', 'Stand up', 'Концерты', 'Спорт', 'Развлечения', 'Маст'
  ];

  final List<Event> allEvents = [
    Event(title: 'Выступление ZAQ', image: 'assets/images/zaq_photo.png', isFree: false, category: 'Концерты'),
    Event(title: 'Концерт Bakr в Астане', image: 'assets/images/bakr_photo.png', isFree: false, category: 'Концерты'),
    Event(title: 'Open-Air Drift-show', image: 'assets/images/car_photo.png', isFree: true, category: 'Спорт'),
    Event(title: 'Тур на автомобиле', image: 'assets/images/camels.png', isFree: false, category: 'Развлечения'),
    Event(title: 'Стендап-концерт', image: 'assets/images/standup1.png', isFree: false, category: 'Stand up'),
    Event(title: 'Александр Меркуля', image: 'assets/images/standup2.png', isFree: false, category: 'Stand up'),
  ];

  String selectedCategory = 'Все';

  List<Event> get filteredEvents {
    if (selectedCategory == 'Все') return allEvents;
    return allEvents.where((event) => event.category == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Категории')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔍 Поиск
            TextField(
              decoration: InputDecoration(
                hintText: 'найти события',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),

            // 🏷 Категории
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final isSelected = selectedCategory == category;

                  return TextButton(
                    onPressed: () {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    child: Text(
                      category,
                      style: TextStyle(
                        color: isSelected ? Colors.black : Colors.grey,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // 📋 Список мероприятий
            Expanded(
              child: GridView.builder(
                itemCount: filteredEvents.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 3 / 2,
                ),
                itemBuilder: (context, index) {
                  final event = filteredEvents[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(event.image, fit: BoxFit.cover, width: double.infinity),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(event.title, style: const TextStyle(fontWeight: FontWeight.w600)),
                      Text(event.isFree ? 'Бесплатный' : 'Платный', style: const TextStyle(fontSize: 12)),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
