import 'package:flutter/material.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final _formKey = GlobalKey<FormState>();
  String eventType = 'Частное';
  String accessType = 'Бесплатный';
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Создайте событие'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_a_photo, size: 32, color: Colors.grey),
                      SizedBox(height: 8),
                      Text('Добавить фото', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Заголовок события',
                  hintText: 'Например, Концерт Макар в Астане',
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ChoiceChip(
                      label: const Text('Частное'),
                      selected: eventType == 'Частное',
                      onSelected: (_) => setState(() => eventType = 'Частное'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ChoiceChip(
                      label: const Text('Приватное'),
                      selected: eventType == 'Приватное',
                      onSelected: (_) => setState(() => eventType = 'Приватное'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: ChoiceChip(
                      label: const Text('Бесплатный'),
                      selected: accessType == 'Бесплатный',
                      onSelected: (_) => setState(() => accessType = 'Бесплатный'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ChoiceChip(
                      label: const Text('Платный'),
                      selected: accessType == 'Платный',
                      onSelected: (_) => setState(() => accessType = 'Платный'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (accessType == 'Платный')
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Стоимость',
                    hintText: 'Укажите стоимость билета',
                  ),
                  keyboardType: TextInputType.number,
                ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Категория'),
                items: ['Музыка', 'Театр', 'Образование']
                    .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                    .toList(),
                onChanged: (val) {},
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(labelText: 'Место'),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Время'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Дата'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                    labelText: 'Описание',
                    hintText: 'Подробности события...'
                ),
                maxLines: 4,
              ),
              const SizedBox(height: 16),
              Container(
                height: 150,
                color: Colors.grey[300],
                alignment: Alignment.center,
                child: const Text('Карта (Заглушка)'),
              ),
              const SizedBox(height: 16),
              const Text('Программа'),
              const SizedBox(height: 8),
              ...List.generate(3, (i) => const Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: TextField(
                  decoration: InputDecoration(hintText: '00:00 - описание'),
                ),
              )),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(labelText: 'Организатор'),
              ),
              const SizedBox(height: 8),
              const TextField(
                decoration: InputDecoration(labelText: 'ID'),
              ),
              const SizedBox(height: 8),
              const TextField(
                decoration: InputDecoration(labelText: 'Телефон'),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () {},
                  child: const Text('Опубликовать'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
