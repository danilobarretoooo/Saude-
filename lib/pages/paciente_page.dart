import 'package:flutter/material.dart';

class PacientePage extends StatefulWidget {
  @override
  _PacientePageState createState() => _PacientePageState();
}

class _PacientePageState extends State<PacientePage> {
  final _formKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final idadeController = TextEditingController();
  final cpfController = TextEditingController();
  final enderecoController = TextEditingController();
  final telefoneController = TextEditingController();

  List<Map<String, String>> pacientes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Pacientes'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nomeController,
                    decoration: InputDecoration(labelText: 'Nome'),
                  ),
                  TextFormField(
                    controller: idadeController,
                    decoration: InputDecoration(labelText: 'Idade'),
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    controller: cpfController,
                    decoration: InputDecoration(labelText: 'CPF'),
                  ),
                  TextFormField(
                    controller: enderecoController,
                    decoration: InputDecoration(labelText: 'Endereço'),
                  ),
                  TextFormField(
                    controller: telefoneController,
                    decoration: InputDecoration(labelText: 'Telefone'),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          pacientes.add({
                            'nome': nomeController.text,
                            'idade': idadeController.text,
                            'cpf': cpfController.text,
                            'endereco': enderecoController.text,
                            'telefone': telefoneController.text,
                          });
                          nomeController.clear();
                          idadeController.clear();
                          cpfController.clear();
                          enderecoController.clear();
                          telefoneController.clear();
                        });
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
                      'Cadastrar',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: pacientes.length,
                itemBuilder: (context, index) {
                  final p = pacientes[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(p['nome'] ?? ''),
                      subtitle: Text(
                        'Idade: ${p['idade']} - CPF: ${p['cpf']}\n'
                            'Endereço: ${p['endereco']}\n'
                            'Telefone: ${p['telefone']}',
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}