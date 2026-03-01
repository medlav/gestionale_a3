import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gestionale_a3/providers/config_provider.dart'; // Import your provider file

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nomeController;
  late TextEditingController _cognomeController;
  late TextEditingController _cfController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    // Grab current values from Provider
    final config = context.read<ConfigProvider>();
    _nomeController = TextEditingController(text: config.medico.nome);
    _cognomeController = TextEditingController(text: config.medico.cognome);
    _cfController = TextEditingController(text: config.medico.codiceFiscale);
    _emailController = TextEditingController(text: config.medico.email);
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _cognomeController.dispose();
    _cfController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _saveSettings() {
    if (_formKey.currentState!.validate()) {
      final currentConfig = context.read<ConfigProvider>().medico;

      final updatedConfig = currentConfig.copyWith(
        nome: _nomeController.text.trim(),
        cognome: _cognomeController.text.trim(),
        codiceFiscale: _cfController.text.trim().toUpperCase(),
        email: _emailController.text.trim(),
      );

      context.read<ConfigProvider>().updateMedico(updatedConfig);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Configurazione salvata con successo!"),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // If provider is still fetching from disk
    final isReady = context.watch<ConfigProvider>().initialized;
    if (!isReady) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Configurazione Medico")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildCard(
                title: "Dati Professionali",
                children: [
                  _buildTextField(_nomeController, "Nome"),
                  const SizedBox(height: 12),
                  _buildTextField(_cognomeController, "Cognome"),
                  const SizedBox(height: 12),
                  _buildTextField(_cfController, "Codice Fiscale"),
                  const SizedBox(height: 12),
                  _buildTextField(
                    _emailController,
                    "Email",
                    keyboardType: TextInputType.emailAddress,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _saveSettings,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text("SALVA MODIFICHE"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({required String title, required List<Widget> children}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Divider(),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label, {
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (v) => v!.isEmpty ? "Campo obbligatorio" : null,
    );
  }
}
