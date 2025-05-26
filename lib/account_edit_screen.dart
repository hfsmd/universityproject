import 'package:flutter/material.dart';

class AccountEditScreen extends StatefulWidget {
  const AccountEditScreen({super.key});

  @override
  State<AccountEditScreen> createState() => _AccountEditScreenState();
}

class _AccountEditScreenState extends State<AccountEditScreen> {
  final TextEditingController _nameController =
  TextEditingController(text: 'Jim Kai');
  final TextEditingController _emailController =
  TextEditingController(text: 'jimkai@gmail.com');
  String language = 'Русский';
  String themeMode = 'Свет';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              const SizedBox(height: 8),
              Center(
                child: CircleAvatar(
                  radius: 36,
                  backgroundImage:
                  AssetImage('assets/images/avatar.png'),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('ID 452362644', style: TextStyle(color: Colors.grey)),
                  IconButton(
                    icon: const Icon(Icons.copy, size: 18),
                    onPressed: () {

                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Поля для редактирования
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Ваше имя',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),

              const Text('Настройки приложения',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),

              // Селекторы языка и темы
              Row(
                children: [
                  const Expanded(child: Text('Язык')),
                  DropdownButton<String>(
                    value: language,
                    items: ['Русский', 'English']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (v) => setState(() => language = v!),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Expanded(child: Text('Тема')),
                  DropdownButton<String>(
                    value: themeMode,
                    items: ['Свет', 'Тёмная']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (v) => setState(() => themeMode = v!),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () {
                  // TODO: изменение пароля
                },
                child: const Text('Изменить пароль',style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(height: 24),

              OutlinedButton(
                onPressed: () {
                  // TODO: удалить аккаунт
                },
                child:
                const Text('Удалить аккаунт', style: TextStyle(color: Colors.red)),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.red),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Выход'),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF3F3F8F)),
                  foregroundColor: const Color(0xFF3F3F8F),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
            ),
        );
    }
}
