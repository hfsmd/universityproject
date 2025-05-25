import 'package:avaproject/event_create_screen.dart';
import 'package:flutter/material.dart';

class EventListScreen extends StatelessWidget {
  const EventListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ваше мероприятие'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) =>CreateEventScreen()),
              );
            },
            child: const Text(
              'Создать',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: const EventCard(
          image: 'assets/images/birthday.png',
          title: 'День рождения',
          tag: 'Частное',
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String image;
  final String title;
  final String tag;

  const EventCard({
    super.key,
    required this.image,
    required this.title,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              image,
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  tag,
                  style: const TextStyle(color: Colors.blueAccent),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
