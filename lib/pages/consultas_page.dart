import 'package:flutter/material.dart';

class ConsultasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final agendamentos = [
      {'paciente': 'Maria', 'medico': 'Dra. Ana Silva', 'data': '20/05/2025', 'hora': '09:00'},
      {'paciente': 'José', 'medico': 'Dr. João Souza', 'data': '20/05/2025', 'hora': '10:00'},
      {'paciente': 'Ana', 'medico': 'Dra. Ana Silva', 'data': '21/05/2025', 'hora': '08:00'},
    ];

    final hoje = DateTime.now();
    final dataHoje = '${hoje.day.toString().padLeft(2, '0')}/${hoje.month.toString().padLeft(2, '0')}/${hoje.year}';

    final consultasHoje = agendamentos.where((consulta) => consulta['data'] == dataHoje).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Consultas de Hoje'),
        backgroundColor: Colors.teal,
      ),
      body: consultasHoje.isEmpty
          ? Center(
        child: Text(
          'Nenhuma consulta agendada para hoje.',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      )
          : ListView.builder(
        itemCount: consultasHoje.length,
        itemBuilder: (context, index) {
          final consulta = consultasHoje[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: Icon(Icons.calendar_today, color: Colors.teal),
              title: Text(
                '${consulta['paciente']} com ${consulta['medico']}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Data: ${consulta['data']} às ${consulta['hora']}'),
            ),
          );
        },
      ),
    );
  }
}