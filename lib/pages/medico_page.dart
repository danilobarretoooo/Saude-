import 'package:flutter/material.dart';

class MedicoPage extends StatelessWidget {
  final List<Map<String, String>> medicos = [
    {'nome': 'Dra. Ana Silva', 'especialidade': 'Cardiologia'},
    {'nome': 'Dr. João Souza', 'especialidade': 'Pediatria'},
    {'nome': 'Dra. Carla Mendes', 'especialidade': 'Dermatologia'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de Médicos',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16.0),
        itemCount: medicos.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
          thickness: 1,
        ),
        itemBuilder: (context, index) {
          final m = medicos[index];
          return ListTile(
            leading: Icon(Icons.person, color: Colors.teal),
            title: Text(
              m['nome']!,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              'Especialidade: ${m['especialidade']}',
              style: TextStyle(fontSize: 16),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
            onTap: () {
              // Ação ao clicar no médico
            },
          );
        },
      ),
    );
  }
}