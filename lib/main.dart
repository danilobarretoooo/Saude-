import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/paciente_page.dart';
import 'pages/medico_page.dart';
import 'pages/agendamento_page.dart';
import 'pages/consultas_page.dart';

void main() {
  runApp(SaudeMaisApp());
}

class SaudeMaisApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saúde+',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => HomePage(),
        '/pacientes': (context) => PacientePage(),
        '/medicos': (context) => MedicoPage(),
        '/agendamento': (context) => AgendamentoPage(),
        '/consultas': (context) => ConsultasPage(),
      },
    );
  }
}
