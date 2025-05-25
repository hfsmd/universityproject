import 'package:avaproject/open_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Изображение вверху
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.asset(
                'assets/images/car_photo.png',
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 16),

            _buildSection(context, 'События дня'),
            _buildSection(context, 'События недели'),
            _buildSection(context, 'События месяца'),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Заголовок и стрелка
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
          const SizedBox(height: 8),

          // Список карточек
          SizedBox(
            height: 190,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildEventCard('Выступление ZAO', 'assets/images/zaq_photo.png', () => Navigator.push(context, MaterialPageRoute(builder: (_)=>EventDetailScreen())),),
                _buildEventCard('Концерт Bakr в Астане', 'assets/images/bakr_photo.png', () => Navigator.push(context, MaterialPageRoute(builder: (_)=>EventDetailScreen()))),
                _buildEventCard('Жарыско в общем', 'assets/images/car_photo.png', () => Navigator.push(context, MaterialPageRoute(builder: (_)=>EventDetailScreen()))),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildEventCard(String title, String imagePath, Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath),
            Text(title, style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold), maxLines: 1,overflow: TextOverflow.ellipsis,),
            const SizedBox(height: 4),
            const Text('Платный', style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
