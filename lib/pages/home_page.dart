import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Saúde+ - Menu Principal',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16.0),
        itemCount: 4,
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
          thickness: 1,
        ),
        itemBuilder: (context, index) {
          final items = [
            {'title': 'Pacientes', 'icon': Icons.people, 'route': '/pacientes'},
            {'title': 'Médicos', 'icon': Icons.local_hospital, 'route': '/medicos'},
            {'title': 'Agendar Consulta', 'icon': Icons.calendar_today, 'route': '/agendamento'},
            {'title': 'Consultas Agendadas', 'icon': Icons.event_note, 'route': '/consultas'},
          ];

          return ListTile(
            leading: Icon(items[index]['icon'] as IconData, color: Colors.teal),
            title: Text(
              items[index]['title'] as String,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
            onTap: () => Navigator.pushNamed(context, items[index]['route'] as String),
          );
        },
      ),
    );
  }
}