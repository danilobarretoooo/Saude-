import 'package:flutter/material.dart';

class AgendamentoPage extends StatefulWidget {
  @override
  _AgendamentoPageState createState() => _AgendamentoPageState();
}

class _AgendamentoPageState extends State<AgendamentoPage> {
  final _formKey = GlobalKey<FormState>();
  final _dataController = TextEditingController();

  String? pacienteSelecionado;
  String? medicoSelecionado;
  String? horarioSelecionado;

  final List<String> pacientes = ['Maria', 'José', 'Ana'];
  final List<String> medicos = ['Dra. Ana Silva', 'Dr. João Souza'];
  final Map<String, List<String>> horariosDisponiveis = {
    '20/05/2025': ['09:00', '10:00', '14:00'],
    '21/05/2025': ['08:00', '11:00', '15:00'],
  };

  List<String> horariosParaData = [];

  void _selecionarData(BuildContext context) async {
    final DateTime? dataSelecionada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (dataSelecionada != null) {
      final dataFormatada =
          '${dataSelecionada.day.toString().padLeft(2, '0')}/${dataSelecionada.month.toString().padLeft(2, '0')}/${dataSelecionada.year}';
      setState(() {
        _dataController.text = dataFormatada;
        horariosParaData = horariosDisponiveis[dataFormatada] ?? [];
        horarioSelecionado = null; // Limpa o horário selecionado
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Agendar Consulta',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Informações do Agendamento',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Paciente',
                  border: OutlineInputBorder(),
                ),
                value: pacienteSelecionado,
                items: pacientes
                    .map((paciente) => DropdownMenuItem(
                  value: paciente,
                  child: Text(paciente),
                ))
                    .toList(),
                onChanged: (value) => setState(() => pacienteSelecionado = value),
              ),
              SizedBox(height: 15),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Médico',
                  border: OutlineInputBorder(),
                ),
                value: medicoSelecionado,
                items: medicos
                    .map((medico) => DropdownMenuItem(
                  value: medico,
                  child: Text(medico),
                ))
                    .toList(),
                onChanged: (value) => setState(() => medicoSelecionado = value),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _dataController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Data',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () => _selecionarData(context),
              ),
              SizedBox(height: 15),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Horário',
                  border: OutlineInputBorder(),
                ),
                value: horarioSelecionado,
                items: horariosParaData
                    .map((horario) => DropdownMenuItem(
                  value: horario,
                  child: Text(horario),
                ))
                    .toList(),
                onChanged: (value) => setState(() => horarioSelecionado = value),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Consulta agendada com sucesso!')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Agendar',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}