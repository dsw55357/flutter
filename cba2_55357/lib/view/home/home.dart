import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cba2_55357/view/login/login_view.dart';
import '../../utils/database_helper.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');

    // Przekierowanie na ekran logowania
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginView()),
    );
  }

  Future<List<Map<String, dynamic>>> _fetchUsers() async {
    return await DatabaseHelper.instance.getUsers();
  }


  Future<void> _simulateFetch() async {
    List<Map<String, dynamic>> tasks = await DatabaseHelper.instance.getUsers();
    print('Pobrane zadania: $tasks'); // Dane w surowej postaci
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () => _logout(context),
            icon: const Icon(Icons.logout),
            tooltip: 'Wyloguj się',
          ),
        ],
      ),
      body: Center(
        child: Column(
        children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
          const SizedBox(height: 16), // Odstęp między przyciskami
          ElevatedButton(
            onPressed: () {
              _simulateFetch(); // Wywołanie metody _simulateFetch
            },
            child: const Text('Pobierz i Wyświetl Rekordy'),
          ),
          const SizedBox(height: 16), // Odstęp między przyciskiem a listą

          Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                  future: _fetchUsers(),
                  builder: (context, snapshot) {

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Błąd: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('Brak użytkowników w bazie danych.'));
                    }

                    final users = snapshot.data ?? []; // Domyślna pusta lista, jeśli snapshot.data jest null / Gwarantuje, że users zawsze będzie miało wartość (lista lub pusta lista), eliminując problem z null.

                    return SingleChildScrollView(
                      child: Column(
                        children: users.map((user) {
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            child: ListTile(
                              title: Text('Name: ${user['name']}'),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Email: ${user['email']}'),
                                  Text('Password: ${user['password']}'),
                                ],
                              ),
                              leading: CircleAvatar(
                                child: Text(user['id'].toString()),
                              ),
                            ),
                          );

                    }).toList(),
                    ),
                    );
                  }
              ),
          ),
        ],
      ),
      ),
    );
  }
}